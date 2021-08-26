import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/gestures.dart';

extension GestureRecognizerDisposed on GestureRecognizer {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
