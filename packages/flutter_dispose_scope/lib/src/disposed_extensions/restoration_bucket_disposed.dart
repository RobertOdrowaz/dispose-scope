import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/services.dart';

extension RestorationBucketDisposed on RestorationBucket {
  void disposed(DisposeScope scope) {
    scope.addDispose(() async => dispose());
  }
}
