import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/painting.dart';

extension DecorationImagePainterDisposed on DecorationImagePainter {
  void disposedBy(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
