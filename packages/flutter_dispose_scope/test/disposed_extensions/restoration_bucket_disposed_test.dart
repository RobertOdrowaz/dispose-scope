import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/restoration_bucket_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'restoration_bucket_disposed_test.mocks.dart';

@GenerateMocks([RestorationBucket])
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
          restorationBucket.disposed(scope);

          await scope.dispose();

          verify(restorationBucket.dispose()).called(1);
        },
      );
    },
  );
}
