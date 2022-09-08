import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/rendering.dart';

extension SemanticsHandleDisposed on SemanticsHandle {
  void disposedBy(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
