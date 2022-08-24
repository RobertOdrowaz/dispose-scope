import 'package:dispose_scope/src/dispose.dart';

/// Groups many [Dispose]s together and allows for disposing of all of them at
/// once.
///
/// [Dispose]s are disposed synchronously in the LIFO order.
class DisposeScope {
  final _disposes = <Dispose>[];

  /// Adds this [dispose] to this [DisposeScope]'s internal list of [Dispose]s.
  ///
  /// [dispose] will be called when this [DisposeScope] is disposed.
  void addDispose(Dispose dispose) {
    _disposes.add(dispose);
  }

  /// Disposes all added [Dispose]s.
  Future<void> dispose() async {
    for (final dispose in _disposes.reversed) {
      await dispose();
    }
  }
}
