import 'package:bloc/bloc.dart';
import 'package:bloc_dispose_scope/src/disposed_extensions/bloc_base_disposed.dart';
import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockBlocBase<T> extends Mock implements BlocBase<T> {}

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
          when(() => blocBase.close()).thenAnswer((_) async {});

          blocBase.disposedBy(scope);

          await scope.dispose();

          verify(() => blocBase.close()).called(1);
        },
      );
    },
  );
}
