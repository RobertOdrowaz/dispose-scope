import 'package:bloc/bloc.dart';
import 'package:dispose_scope/dispose_scope.dart';

extension BlocBaseDisposed<State> on BlocBase<State> {
  void disposed(DisposeScope scope) {
    scope.addDispose(close);
  }
}
