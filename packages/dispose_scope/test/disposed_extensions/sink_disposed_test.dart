import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:dispose_scope/src/disposed_extensions/sink_disposed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockSink<T> extends Mock implements Sink<T> {}

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

          verify(() => sink.close()).called(1);
        },
      );
    },
  );
}
