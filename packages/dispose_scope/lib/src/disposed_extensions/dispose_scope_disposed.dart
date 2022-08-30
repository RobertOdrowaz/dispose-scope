import 'package:dispose_scope/dispose_scope.dart';

/// Extends [DisposeScope] with disposing capabilities.
///
/// This means that your [DisposeScope] can dispose another [DisposeScope]s.
///
/// For example, you might want to have many child [DisposeScope]s and one
/// parent [DisposeScope]. All child [DisposeScope]s can be canceled at once by
/// disposing the parent [DisposeScope].
extension DisposeScopeDisposed on DisposeScope {
  /// Adds this dispose scope to [parentDisposeScope].
  ///
  /// It will be disposed when [parentDisposeScope] is disposed.
  void disposed(DisposeScope parentDisposeScope) {
    if (parentDisposeScope == this) {
      throw Exception(
        '''
Dispose scope cannot contain itself.

This is likely a mistake and you meant to call DisposeScope.dispose() instead.
''',
      );
    }

    parentDisposeScope.addDispose(dispose);
  }
}
