import 'dart:async';

import 'package:dispose_scope/src/dispose.dart';

/// Groups many [Dispose]s together and allows for disposing of all of them at
/// once.
///
/// [Dispose]s are disposed synchronously in the LIFO order.
class DisposeScope {
  final _disposes = <Dispose>[];

  bool _disposed = false;

  /// Whether [dispose] was called on this dispose scope.
  ///
  /// After adispose scope is disposed, it cannot be used again.
  bool get disposed => _disposed;

  /// Adds this [dispose] to this [DisposeScope]'s internal list of [Dispose]s.
  ///
  /// [dispose] will be called when this [DisposeScope] is disposed.
  void addDispose(Dispose dispose) {
    if (_disposed) {
      throw StateError('This dispose scope is already disposed');
    }

    _disposes.add(dispose);
  }

  /// Disposes all added [Dispose]s.
  Future<void> dispose() async {
    if (_disposed) {
      throw StateError('This dispose scope is already disposed');
    }

    _disposed = true;
    for (final dispose in _disposes.reversed) {
      await dispose();
    }
  }

  /// Calls [block] only if this dispose scope is not yet disposed. Otherwise,
  /// it's a no-op.
  Future<void> run(FutureOr<void> Function(DisposeScope scope) block) async {
    if (!_disposed) {
      await block(this);
    }
  }
}
