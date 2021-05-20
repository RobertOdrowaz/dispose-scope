import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:dispose_scope/src/disposed_extensions/dispose_scope_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dispose_scope_implementation.dart';
import 'dispose_scope_disposed_test.mocks.dart';

@GenerateMocks([DisposeScope])
void main() {
  group(
    'ConnectionTaskDisposed',
    () {
      late DisposeScopeImplementation scope;
      late MockDisposeScope disposeScope;

      setUp(
        () {
          scope = DisposeScopeImplementation();
          disposeScope = MockDisposeScope();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          disposeScope.disposed(scope);

          await scope.dispose();

          verify(disposeScope.dispose()).called(1);
        },
      );

      test(
        'throws Exception when disposed is called with the same store',
        () async {
          expect(() => disposeScope.disposed(disposeScope), throwsException);
        },
      );
    },
  );
}
