import 'dart:async';

import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:dispose_scope/src/disposed_extensions/timer_disposed.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'timer_disposed_test.mocks.dart';

@GenerateMocks([Timer])
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
          timer.disposed(scope);

          await scope.dispose();

          verify(timer.cancel()).called(1);
        },
      );
    },
  );
}
