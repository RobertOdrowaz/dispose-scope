import 'dart:async';

import 'package:dispose_scope/src/disposed_extensions/timer_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dispose_scope_implementation.dart';
import 'timer_disposed_test.mocks.dart';

@GenerateMocks([Timer])
void main() {
  group(
    'TimerDisposed',
    () {
      late DisposeScopeImplementation scope;
      late MockTimer timer;

      setUp(
        () {
          scope = DisposeScopeImplementation();
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
