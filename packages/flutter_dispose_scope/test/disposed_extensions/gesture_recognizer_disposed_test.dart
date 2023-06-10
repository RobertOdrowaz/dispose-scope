import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/gesture_recognizer_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGestureRecognizer extends Mock implements GestureRecognizer {
  @override
  String toString({DiagnosticLevel? minLevel}) => '';
}

void main() {
  group(
    'GestureRecognizerDisposed',
    () {
      late DisposeScope scope;
      late MockGestureRecognizer gestureRecognizer;

      setUp(
        () {
          scope = DisposeScope();
          gestureRecognizer = MockGestureRecognizer();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          gestureRecognizer.disposedBy(scope);

          await scope.dispose();

          verify(() => gestureRecognizer.dispose()).called(1);
        },
      );
    },
  );
}
