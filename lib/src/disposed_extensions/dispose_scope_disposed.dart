import 'package:dispose_scope/dispose_scope.dart';

extension DisposeScopeDisposed on DisposeScope {
  void disposed(DisposeScope scope) {
    if (scope == this) {
      throw Exception('''
Dispose scope cannot contain itself.

This is likely as mistake and you meant to call DisposeScope.dispose() instead.
''');
    }

    scope.addDispose(dispose);
  }
}
