import 'dart:async';

import 'package:dispose_scope/dispose_scope.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockTimer extends Mock implements Timer {}

void main() {
  group(
    'TimerDisposed',
    () {
      late DisposeScope scope;
      late MockTimer timer;

      setUp(
        () {
          scope = DisposeScope();
          timer = MockTimer();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          timer.disposedBy(scope);

          await scope.dispose();

          verify(() => timer.cancel()).called(1);
        },
      );
    },
  );
}
