import 'package:dispose_scope/dispose_scope.dart';

/// An object that can be disposed.
abstract class Disposable {
  /// Adds this object to [disposeScope].
  void disposed(DisposeScope disposeScope) {
    disposeScope.addDispose(dispose);
  }

  /// Disposes this object.
  Future<void> dispose();
}
