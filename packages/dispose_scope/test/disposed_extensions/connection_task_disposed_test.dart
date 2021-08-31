import 'dart:io';

import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:dispose_scope/src/disposed_extensions/connection_task_disposed.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'connection_task_disposed_test.mocks.dart';

@GenerateMocks([ConnectionTask])
void main() {
  group(
    'ConnectionTaskDisposed',
    () {
      late DisposeScope scope;
      late MockConnectionTask connectionTask;

      setUp(
        () {
          scope = DisposeScope();
          connectionTask = MockConnectionTask();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          connectionTask.disposed(scope);

          await scope.dispose();

          verify(connectionTask.cancel()).called(1);
        },
      );
    },
  );
}
