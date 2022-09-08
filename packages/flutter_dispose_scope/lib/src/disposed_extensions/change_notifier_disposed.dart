import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/foundation.dart';

extension ChangeNotifierDisposed on ChangeNotifier {
  void disposedBy(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
