import 'package:dispose_scope/dispose_scope.dart';
import 'package:meta/meta.dart';

/// An object that can be disposed.
abstract class Disposable {
  /// Adds this object to [disposeScope].
  @nonVirtual
  void disposedBy(DisposeScope disposeScope) {
    disposeScope.addDispose(dispose);
  }

  /// Disposes this object.
  @mustCallSuper
  Future<void> dispose();
}
