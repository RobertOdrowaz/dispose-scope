import 'dart:io';

import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:dispose_scope/src/disposed_extensions/connection_task_disposed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockConnectionTask<T> extends Mock implements ConnectionTask<T> {}

void main() {
  group(
    'ConnectionTaskDisposed',
    () {
      late DisposeScope scope;
      late MockConnectionTask connectionTask;

      setUp(
        () {
          scope = DisposeScope();
          connectionTask = MockConnectionTask<void>();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          connectionTask.disposedBy(scope);

          await scope.dispose();

          verify(() => connectionTask.cancel()).called(1);
        },
      );
    },
  );
}
