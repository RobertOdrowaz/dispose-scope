import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/decoration_image_painter_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'decoration_image_painter_disposed_test.mocks.dart';

@GenerateMocks([DecorationImagePainter])
void main() {
  group(
    'DecorationImagePainterDisposed',
    () {
      late DisposeScope scope;
      late MockDecorationImagePainter decorationImagePainter;

      setUp(
        () {
          scope = DisposeScope();
          decorationImagePainter = MockDecorationImagePainter();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          decorationImagePainter.disposed(scope);

          await scope.dispose();

          verify(decorationImagePainter.dispose()).called(1);
        },
      );
    },
  );
}
