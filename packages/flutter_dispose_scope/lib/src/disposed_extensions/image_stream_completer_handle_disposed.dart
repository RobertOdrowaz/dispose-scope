import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/painting.dart';

extension ImageStreamCompleterHandleDisposed on ImageStreamCompleterHandle {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
