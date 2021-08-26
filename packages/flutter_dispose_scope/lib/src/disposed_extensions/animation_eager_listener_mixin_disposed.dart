import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/animation.dart';

extension AnimationEagerListenerMixinDisposed on AnimationEagerListenerMixin {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
