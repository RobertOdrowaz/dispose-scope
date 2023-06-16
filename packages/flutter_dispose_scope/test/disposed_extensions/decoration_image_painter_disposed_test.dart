import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/decoration_image_painter_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDecorationImagePainter extends Mock
    implements DecorationImagePainter {}

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
          decorationImagePainter.disposedBy(scope);

          await scope.dispose();

          verify(() => decorationImagePainter.dispose()).called(1);
        },
      );
    },
  );
}
