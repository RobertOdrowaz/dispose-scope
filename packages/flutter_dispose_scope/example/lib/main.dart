import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_dispose_scope/flutter_dispose_scope.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with StateDisposeScopeMixin {
  @override
  void initState() {
    super.initState();

    // StreamSubscription will be cancelled when widget is disposed
    const Stream.empty().listen((event) {}).disposed(scope);

    // Timer will be cancelled when widget is disposed
    Timer(Duration.zero, () {}).disposed(scope);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SizedBox(),
    );
  }
}
