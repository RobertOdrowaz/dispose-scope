import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/widgets.dart';

extension ScrollDragControllerDisposed on ScrollDragController {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
