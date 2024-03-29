import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/disposable_build_context_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDisposableBuildContext extends Mock
    implements DisposableBuildContext {}

void main() {
  group(
    'DisposableBuildContextDisposed',
    () {
      late DisposeScope scope;
      late MockDisposableBuildContext disposableBuildContext;

      setUp(
        () {
          scope = DisposeScope();
          disposableBuildContext = MockDisposableBuildContext();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          disposableBuildContext.disposedBy(scope);

          await scope.dispose();

          verify(() => disposableBuildContext.dispose()).called(1);
        },
      );
    },
  );
}
