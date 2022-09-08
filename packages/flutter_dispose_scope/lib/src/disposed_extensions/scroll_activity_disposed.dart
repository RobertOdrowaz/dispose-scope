import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/widgets.dart';

extension ScrollActivityDisposed on ScrollActivity {
  void disposedBy(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
