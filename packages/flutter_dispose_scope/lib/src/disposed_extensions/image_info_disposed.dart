import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/painting.dart';

extension ImageInfoDisposed on ImageInfo {
  void disposedBy(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
