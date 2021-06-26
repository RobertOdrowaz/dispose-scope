import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/state_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockState extends Mock implements State {
  @override
  String toString({DiagnosticLevel? minLevel}) => '';
}

void main() {
  group(
    'StateDisposed',
    () {
      late DisposeScope scope;
      late MockState state;

      setUp(
        () {
          scope = DisposeScope();
          state = MockState();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          state.disposed(scope);

          await scope.dispose();

          // ignore: invalid_use_of_protected_member
          verify(state.dispose()).called(1);
        },
      );
    },
  );
}
