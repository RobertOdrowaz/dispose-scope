import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/scheduler.dart';

extension TickerDisposed on Ticker {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
