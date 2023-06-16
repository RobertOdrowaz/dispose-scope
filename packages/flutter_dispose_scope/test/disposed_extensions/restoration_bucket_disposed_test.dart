import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/restoration_bucket_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRestorationBucket extends Mock implements RestorationBucket {}

void main() {
  group(
    'RestorationBucketDisposed',
    () {
      late DisposeScope scope;
      late MockRestorationBucket restorationBucket;

      setUp(
        () {
          scope = DisposeScope();
          restorationBucket = MockRestorationBucket();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          restorationBucket.disposedBy(scope);

          await scope.dispose();

          verify(() => restorationBucket.dispose()).called(1);
        },
      );
    },
  );
}
