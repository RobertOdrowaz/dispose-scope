import 'package:dispose_scope/src/disposed_extensions/sink_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dispose_scope_implementation.dart';
import 'sink_disposed_test.mocks.dart';

@GenerateMocks([Sink])
void main() {
  group(
    'SinkDisposed',
    () {
      late DisposeScopeImplementation scope;
      late MockSink sink;

      setUp(
        () {
          scope = DisposeScopeImplementation();
          sink = MockSink();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          sink.disposed(scope);

          await scope.dispose();

          verify(sink.close()).called(1);
        },
      );
    },
  );
}
