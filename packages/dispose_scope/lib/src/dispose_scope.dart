import 'package:dispose_scope/src/dispose.dart';

/// Groups many [DisposeCallback]s together and allows for disposing of all of
/// them at once.
///
/// [DisposeCallback]s are disposed synchronously in the LIFO order.
class DisposeScope {
  final _disposes = <DisposeCallback>[];

  /// Adds this [disposeCallback] to this [DisposeScope]'s internal list of
  /// [DisposeCallback]s.
  ///
  /// [disposeCallback] will be called when this [DisposeScope] is disposed.
  void addDispose(DisposeCallback disposeCallback) {
    _disposes.add(disposeCallback);
  }

  /// Disposes all added [DisposeCallback]s.
  Future<void> dispose() async {
    for (final dispose in _disposes.reversed) {
      await dispose();
    }
  }
}
