import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_dispose_scope/flutter_dispose_scope.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with StateDisposeScopeMixin {
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
    return MaterialApp(
      home: SizedBox(),
    );
  }
}
