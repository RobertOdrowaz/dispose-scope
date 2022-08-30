import 'dart:async';

import 'package:dispose_scope/dispose_scope.dart';

void main() {
  final disposeScope = DisposeScope();

  // StreamSubscription will be cancelled when disposeScope is disposed
  const Stream<void>.empty().listen((dynamicevent) {}).disposed(disposeScope);

  // Timer will be cancelled when disposeScope is disposed
  Timer(Duration.zero, () {}).disposed(disposeScope);

  disposeScope.dispose();
}
