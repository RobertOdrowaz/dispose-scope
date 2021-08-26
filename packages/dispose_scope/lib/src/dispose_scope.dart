import 'package:dispose_scope/src/dispose.dart';

class DisposeScope {
  final _disposes = <Dispose>[];

  void addDispose(Dispose dispose) => _disposes.add(dispose);

  Future<void> dispose() async {
    for (final dispose in _disposes.reversed) {
      await dispose();
    }
  }
}
