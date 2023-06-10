import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:dispose_scope/src/disposed_extensions/dispose_scope_disposed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockDisposeScope extends Mock implements DisposeScope {}

void main() {
  group(
    'ConnectionTaskDisposed',
    () {
      late DisposeScope scope;
      late MockDisposeScope disposeScope;

      setUp(
        () {
          scope = DisposeScope();
          disposeScope = MockDisposeScope();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          when(() => disposeScope.dispose()).thenAnswer((_) async {});
          disposeScope.disposedBy(scope);

          await scope.dispose();

          verify(() => disposeScope.dispose()).called(1);
        },
      );

      test(
        'throws Exception when disposed is called with the same store',
        () async {
          expect(() => disposeScope.disposedBy(disposeScope), throwsStateError);
        },
      );
    },
  );
}
