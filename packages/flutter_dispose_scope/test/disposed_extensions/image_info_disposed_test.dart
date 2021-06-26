import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/image_info_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'image_info_disposed_test.mocks.dart';

@GenerateMocks([ImageInfo])
void main() {
  group(
    'ImageInfoDisposed',
    () {
      late DisposeScope scope;
      late MockImageInfo imageInfo;

      setUp(
        () {
          scope = DisposeScope();
          imageInfo = MockImageInfo();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          imageInfo.disposed(scope);

          await scope.dispose();

          verify(imageInfo.dispose()).called(1);
        },
      );
    },
  );
}
