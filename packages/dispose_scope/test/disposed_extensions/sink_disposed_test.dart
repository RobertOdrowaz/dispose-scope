import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:dispose_scope/src/disposed_extensions/sink_disposed.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'sink_disposed_test.mocks.dart';

@GenerateMocks([Sink])
void main() {
  group(
    'SinkDisposed',
    () {
      late DisposeScope scope;
      late MockSink sink;

      setUp(
        () {
          scope = DisposeScope();
          sink = MockSink<void>();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          sink.disposedBy(scope);

          await scope.dispose();

          verify(sink.close()).called(1);
        },
      );
    },
  );
}
