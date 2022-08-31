# DisposeScope

DisposeScope reduces the amount of boilerplate related to disposing/canceling/closing objects when no longer needed.
The `DisposeScope` class stores references to appropriate `dispose`/`close`/`cancel` methods and calls them when the scope is disposed.

This package can be used by itself however it's mainly intended as base for [flutter_dispose_scope](https://pub.dev/packages/flutter_dispose_scope) and [bloc_dispose_scope](https://pub.dev/packages/bloc_dispose_scope) packages.

## Usage

```dart
import 'package:dispose_scope/dispose_scope.dart';

final disposeScope = DisposeScope();

// StreamSubscription will be cancelled when disposeScope is disposed
const Stream.empty().listen((event) {}).disposedBy(disposeScope);

// Timer will be cancelled when disposeScope is disposed
Timer(Duration.zero, () {}).disposedBy(disposeScope);

disposeScope.dispose();
```

## Supported types

This package contains extension methods for dart standard library classes requiring clean up. For additional extension methods checkout [flutter_dispose_scope](https://pub.dev/packages/flutter_dispose_scope) and [bloc_dispose_scope](https://pub.dev/packages/bloc_dispose_scope).
