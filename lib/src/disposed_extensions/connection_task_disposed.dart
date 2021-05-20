import 'dart:io';

import 'package:dispose_scope/dispose_scope.dart';

extension ConnectionTaskDisposed on ConnectionTask {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => cancel());
  }
}
