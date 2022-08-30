import 'package:dispose_scope/dispose_scope.dart';

/// Extends [Sink] to work with [DisposeScope].
extension SinkDisposed on Sink {
  /// Adds this sink to [disposeScope].
  ///
  /// It will be closed when [disposeScope] is disposed.
  void disposed(DisposeScope disposeScope) {
    disposeScope.addDispose(() async => close());
  }
}
