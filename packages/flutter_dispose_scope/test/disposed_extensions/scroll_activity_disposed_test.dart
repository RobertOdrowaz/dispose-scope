import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/scroll_activity_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'scroll_activity_disposed_test.mocks.dart';

@GenerateMocks([ScrollActivity])
void main() {
  group(
    'ScrollActivityDisposed',
    () {
      late DisposeScope scope;
      late MockScrollActivity scrollActivity;

      setUp(
        () {
          scope = DisposeScope();
          scrollActivity = MockScrollActivity();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          scrollActivity.disposed(scope);

          await scope.dispose();

          verify(scrollActivity.dispose()).called(1);
        },
      );
    },
  );
}
