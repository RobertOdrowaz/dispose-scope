# BlocDisposeScope

BlocDisposeScope adds support for flutter related types to [dispose_scope](https://pub.dev/packages/dispose_scope) package.

## Usage

```dart
import 'package:flutter_dispose_scope/flutter_dispose_scope.dart';

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
```
