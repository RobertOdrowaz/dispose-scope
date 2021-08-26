import 'dart:async';

import 'package:dispose_scope/dispose_scope.dart';

extension TimerDisposed on Timer {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => cancel());
  }
}
