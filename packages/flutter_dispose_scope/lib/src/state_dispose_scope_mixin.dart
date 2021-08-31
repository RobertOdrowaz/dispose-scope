import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

mixin StateDisposeScopeMixin<T extends StatefulWidget> on State<T> {
  var _scope = DisposeScope();

  DisposeScope get scope => _scope;

  @visibleForTesting
  set scope(DisposeScope scope) => _scope = scope;

  @override
  void dispose() {
    _scope.dispose();
    super.dispose();
  }
}
