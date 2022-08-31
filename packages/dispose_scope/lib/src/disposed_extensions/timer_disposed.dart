import 'dart:async';

import 'package:dispose_scope/dispose_scope.dart';

/// Extends [Timer] to work with [DisposeScope].
extension TimerDisposed on Timer {
  /// Adds this timer to [disposeScope].
  ///
  /// It will be canceled when [disposeScope] is disposed.
  void disposedBy(DisposeScope disposeScope) {
    disposeScope.addDispose(() async => cancel());
  }
}
