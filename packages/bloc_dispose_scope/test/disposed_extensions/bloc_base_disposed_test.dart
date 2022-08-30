import 'package:bloc/bloc.dart';
import 'package:bloc_dispose_scope/src/disposed_extensions/bloc_base_disposed.dart';
import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'bloc_base_disposed_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<BlocBase>(unsupportedMembers: {#state})
  ],
)
void main() {
  group(
    'BlocBaseDisposed',
    () {
      late DisposeScope scope;
      late MockBlocBase blocBase;

      setUp(
        () {
          scope = DisposeScope();
          blocBase = MockBlocBase();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          blocBase.disposed(scope);

          await scope.dispose();

          verify(blocBase.close()).called(1);
        },
      );
    },
  );
}
