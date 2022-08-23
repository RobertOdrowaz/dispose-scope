import 'package:dispose_scope/dispose_scope.dart';

/// Function which does disposing when called.
///
/// Even though this function is asynchronous, it should finish fast. The longer
/// it executes, the longer the call to [DisposeScope.dispose] takes.
typedef DisposeCallback = Future<void> Function();
