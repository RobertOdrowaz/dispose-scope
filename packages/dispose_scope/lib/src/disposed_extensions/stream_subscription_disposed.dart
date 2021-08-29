import 'dart:async';
import 'package:dispose_scope/dispose_scope.dart';

extension StreamSubscriptionDisposed on StreamSubscription {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => cancel());
  }
}
