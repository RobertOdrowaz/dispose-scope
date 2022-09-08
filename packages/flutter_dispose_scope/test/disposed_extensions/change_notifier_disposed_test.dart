import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/change_notifier_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_notifier_disposed_test.mocks.dart';

@GenerateMocks([ChangeNotifier])
void main() {
  group(
    'ChangeNotifierDisposed',
    () {
      late DisposeScope scope;
      late MockChangeNotifier changeNotifier;

      setUp(
        () {
          scope = DisposeScope();
          changeNotifier = MockChangeNotifier();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          changeNotifier.disposedBy(scope);

          await scope.dispose();

          verify(changeNotifier.dispose()).called(1);
        },
      );
    },
  );
}
