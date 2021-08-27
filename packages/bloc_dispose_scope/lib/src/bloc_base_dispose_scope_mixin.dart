import 'package:bloc/bloc.dart';
import 'package:dispose_scope/dispose_scope.dart';
import 'package:flutter/widgets.dart';

mixin BlocBaseDisposeScopeMixin<State> on BlocBase<State> {
  var _scope = DisposeScope();

  DisposeScope get scope => _scope;

  @visibleForTesting
  set scope(DisposeScope scope) => _scope = scope;

  @override
  Future<void> close() async {
    _scope.dispose();
    await super.close();
  }
}
