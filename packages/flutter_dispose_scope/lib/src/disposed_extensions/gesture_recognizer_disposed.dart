import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/gestures.dart';

extension GestureRecognizerDisposed on GestureRecognizer {
  void disposedBy(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
