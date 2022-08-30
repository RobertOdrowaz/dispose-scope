import 'dart:io';

import 'package:dispose_scope/dispose_scope.dart';

/// Extends [Process] to work with [DisposeScope].
extension ProcessDisposed on Process {
  /// Adds this process to [disposeScope].
  ///
  /// It will be killed when [disposeScope] is disposed.
  void disposed(DisposeScope disposeScope) {
    disposeScope.addDispose(() async => kill());
  }
}
