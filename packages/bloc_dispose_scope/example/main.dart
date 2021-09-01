import 'package:bloc/bloc.dart';
import 'package:bloc_dispose_scope/bloc_dispose_scope.dart';

class DependencyCubit extends Cubit<String> {
  DependencyCubit() : super('');
}

class MainCubit extends Cubit<String> with BlocBaseDisposeScopeMixin {
  MainCubit(this._dependencyCubit) : super('') {
    // StreamSubscription will be cancelled when MainCubit is closed
    _dependencyCubit.stream
        .listen(_onDependencyCubitStateChanged)
        .disposed(scope);
  }

  final DependencyCubit _dependencyCubit;

  void _onDependencyCubitStateChanged(String dependencyState) {}
}

void main() {
  final disposeScope = DisposeScope();

  // Both cubits will be disposed when disposeScope is disposed
  final _dependencyCubit = DependencyCubit()..disposed(disposeScope);
  MainCubit(_dependencyCubit).disposed(disposeScope);

  disposeScope.dispose();
}
