import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'disposable.dart';
import 'dispose_scope_test.mocks.dart';

@GenerateMocks([Disposable])
void main() {
  group(
    'DisposeScope',
    () {
      late DisposeScope scope;
      late MockDisposable disposable1;
      late MockDisposable disposable2;
      late MockDisposable disposable3;

      setUp(
        () {
          scope = DisposeScope();
          disposable1 = MockDisposable();
          disposable2 = MockDisposable();
          disposable3 = MockDisposable();
        },
      );

      test(
        'calls all disposes when dispose is called',
        () async {
          scope
            ..addDispose(() async => disposable1.dispose())
            ..addDispose(() async => disposable2.dispose())
            ..addDispose(() async => disposable3.dispose());

          await scope.dispose();

          verify(disposable1.dispose()).called(1);
          verify(disposable2.dispose()).called(1);
          verify(disposable3.dispose()).called(1);
        },
      );

      test(
        'calls disposes in reverse order to addition when dispose is called',
        () async {
          scope
            ..addDispose(() async => disposable1.dispose())
            ..addDispose(() async => disposable2.dispose())
            ..addDispose(() async => disposable3.dispose());

          await scope.dispose();

          verifyInOrder(
            [
              disposable3.dispose(),
              disposable2.dispose(),
              disposable1.dispose(),
            ],
          );
        },
      );
    },
  );
}
