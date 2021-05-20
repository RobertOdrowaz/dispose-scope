import 'package:dispose_scope/dispose_scope.dart';

extension SinkDisposed<T> on Sink<T> {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => close());
  }
}
