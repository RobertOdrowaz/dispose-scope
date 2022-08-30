import 'dart:async';

import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:dispose_scope/src/disposed_extensions/stream_subscription_disposed.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'stream_subscription_disposed_test.mocks.dart';

@GenerateMocks([StreamSubscription])
void main() {
  group(
    'StreamSubscriptionDisposed',
    () {
      late DisposeScope scope;
      // ignore: cancel_subscriptions
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
          streamSubscription.disposed(scope);

          await scope.dispose();

          verify(streamSubscription.cancel()).called(1);
        },
      );
    },
  );
}
