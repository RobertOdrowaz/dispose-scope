import 'package:dispose_scope/dispose_scope.dart';

/// Extends [Sink] to work with [DisposeScope].
extension SinkDisposed on Sink {
  /// Adds this sink to [disposeScope].
  ///
  /// It will be closed when [disposeScope] is disposed.
  void disposedBy(DisposeScope disposeScope) {
    disposeScope.addDispose(close);
  }
}
