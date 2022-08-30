import 'dart:async';

import 'package:dispose_scope/dispose_scope.dart';

/// Extends [StreamSubscription] to work with [DisposeScope].
extension StreamSubscriptionDisposed on StreamSubscription {
  /// Adds this stream subscription to [disposeScope].
  ///
  /// It will be canceled when [disposeScope] is disposed.
  void disposed(DisposeScope disposeScope) {
    disposeScope.addDispose(() async => cancel());
  }
}
