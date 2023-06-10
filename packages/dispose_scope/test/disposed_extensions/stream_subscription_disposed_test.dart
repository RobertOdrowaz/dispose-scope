import 'dart:async';

import 'package:dispose_scope/dispose_scope.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockStreamSubscription<T> extends Mock implements StreamSubscription<T> {}

void main() {
  group(
    'StreamSubscriptionDisposed',
    () {
      late DisposeScope scope;
      late MockStreamSubscription streamSubscription;

      setUp(
        () {
          scope = DisposeScope();
          streamSubscription = MockStreamSubscription<void>();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          when(() => streamSubscription.cancel()).thenAnswer((_) async {});
          streamSubscription.disposedBy(scope);

          await scope.dispose();

          verify(() => streamSubscription.cancel()).called(1);
        },
      );
    },
  );
}
