import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/semantics_handle_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'semantics_handle_disposed_test.mocks.dart';

@GenerateMocks([SemanticsHandle])
void main() {
  group(
    'SemanticsHandleDisposed',
    () {
      late DisposeScope scope;
      late MockSemanticsHandle semanticsHandle;

      setUp(
        () {
          scope = DisposeScope();
          semanticsHandle = MockSemanticsHandle();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          semanticsHandle.disposedBy(scope);

          await scope.dispose();

          verify(semanticsHandle.dispose()).called(1);
        },
      );
    },
  );
}
