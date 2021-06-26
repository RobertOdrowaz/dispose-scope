import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/widgets.dart';

extension StateDisposed<T extends StatefulWidget> on State<T> {
  void disposed(DisposeScope scope) {
    // ignore: invalid_use_of_protected_member
    scope.addDispose(() async => dispose());
  }
}
