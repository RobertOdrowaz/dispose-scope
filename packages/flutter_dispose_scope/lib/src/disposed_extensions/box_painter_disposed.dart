import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/painting.dart';

extension BoxPainterDisposed on BoxPainter {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
