import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/animation_eager_listener_mixin_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAnimationEagerListenerMixin extends Mock
    implements AnimationEagerListenerMixin {}

void main() {
  group(
    'AnimationEagerListenerMixinDisposed',
    () {
      late DisposeScope scope;
      late MockAnimationEagerListenerMixin animationEagerListenerMixin;

      setUp(
        () {
          scope = DisposeScope();
          animationEagerListenerMixin = MockAnimationEagerListenerMixin();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          animationEagerListenerMixin.disposedBy(scope);

          await scope.dispose();

          verify(() => animationEagerListenerMixin.dispose()).called(1);
        },
      );
    },
  );
}
