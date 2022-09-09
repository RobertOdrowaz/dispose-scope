# bloc_dispose_scope

This package adds support for bloc related types to [dispose_scope] package.

## Usage

```dart
import 'package:bloc_dispose_scope/bloc_dispose_scope.dart';

class MainCubit extends Cubit<String> with BlocBaseDisposeScopeMixin {
  MainCubit(this._dependencyCubit) : super('') {
    // StreamSubscription will be cancelled when MainCubit is closed
    _dependencyCubit.stream
        .listen(_onDependencyCubitStateChanged)
        .disposedBy(scope);
  }

  final DependencyCubit _dependencyCubit;

  void _onDependencyCubitStateChanged(String dependencyState) {}
}
```

[dispose_scope]: https://pub.dev/packages/dispose_scope
