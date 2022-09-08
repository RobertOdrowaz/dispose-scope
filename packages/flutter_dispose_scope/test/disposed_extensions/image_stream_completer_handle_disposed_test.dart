import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/image_stream_completer_handle_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'image_stream_completer_handle_disposed_test.mocks.dart';

@GenerateMocks([ImageStreamCompleterHandle])
void main() {
  group(
    'ImageStreamCompleterHandleDisposed',
    () {
      late DisposeScope scope;
      late MockImageStreamCompleterHandle imageStreamCompleterHandle;

      setUp(
        () {
          scope = DisposeScope();
          imageStreamCompleterHandle = MockImageStreamCompleterHandle();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          imageStreamCompleterHandle.disposedBy(scope);

          await scope.dispose();

          verify(imageStreamCompleterHandle.dispose()).called(1);
        },
      );
    },
  );
}
