import 'package:dispose_scope/dispose_scope.dart';

abstract class Disposable {
  void disposed(DisposeScope scope) {
    scope.addDispose(dispose);
  }

  Future<void> dispose();
}
