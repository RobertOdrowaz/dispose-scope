import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/box_painter_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'box_painter_disposed_test.mocks.dart';

@GenerateMocks([BoxPainter])
void main() {
  group(
    'BoxPainterDisposed',
    () {
      late DisposeScope scope;
      late MockBoxPainter boxPainter;

      setUp(
        () {
          scope = DisposeScope();
          boxPainter = MockBoxPainter();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          boxPainter.disposed(scope);

          await scope.dispose();

          verify(boxPainter.dispose()).called(1);
        },
      );
    },
  );
}
