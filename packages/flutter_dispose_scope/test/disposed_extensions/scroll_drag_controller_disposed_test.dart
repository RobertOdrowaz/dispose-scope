import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/scroll_drag_controller_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'scroll_drag_controller_disposed_test.mocks.dart';

@GenerateMocks([ScrollDragController])
void main() {
  group(
    'ScrollDragControllerDisposed',
    () {
      late DisposeScope scope;
      late MockScrollDragController scrollDragController;

      setUp(
        () {
          scope = DisposeScope();
          scrollDragController = MockScrollDragController();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          scrollDragController.disposedBy(scope);

          await scope.dispose();

          verify(scrollDragController.dispose()).called(1);
        },
      );
    },
  );
}
