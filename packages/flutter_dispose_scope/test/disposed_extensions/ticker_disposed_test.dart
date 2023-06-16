import 'package:dispose_scope/src/dispose_scope.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dispose_scope/src/disposed_extensions/ticker_disposed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTicker extends Mock implements Ticker {
  @override
  String toString({bool? debugIncludeStack}) => '';
}

void main() {
  group(
    'TickerDisposed',
    () {
      late DisposeScope scope;
      late MockTicker ticker;

      setUp(
        () {
          scope = DisposeScope();
          ticker = MockTicker();
        },
      );

      test(
        'adds Dispose to DisposeScope when disposed is called',
        () async {
          ticker.disposedBy(scope);

          await scope.dispose();

          verify(() => ticker.dispose()).called(1);
        },
      );
    },
  );
}
