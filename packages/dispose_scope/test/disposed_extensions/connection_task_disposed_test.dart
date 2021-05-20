import 'dart:io';

import 'package:dispose_scope/src/disposed_extensions/connection_task_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dispose_scope_implementation.dart';
import 'connection_task_disposed_test.mocks.dart';

@GenerateMocks([ConnectionTask])
void main() {
  group(
    'ConnectionTaskDisposed',
    () {
      late DisposeScopeImplementation scope;
      late MockConnectionTask connectionTask;

      setUp(
        () {
          scope = DisposeScopeImplementation();
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
