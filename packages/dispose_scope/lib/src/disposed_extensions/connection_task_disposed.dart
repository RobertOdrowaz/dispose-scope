import 'dart:io';

import 'package:dispose_scope/dispose_scope.dart';

/// Extends [ConnectionTask] to work with [DisposeScope].
extension ConnectionTaskDisposed on ConnectionTask {
  /// Adds this connection task to [disposeScope].
  ///
  /// It will be canceled when [disposeScope] is disposed.
  void disposedBy(DisposeScope disposeScope) {
    disposeScope.addDispose(() async => cancel());
  }
}
