import 'package:core_logger/core_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoreLogger not Initialized Tests', () {
    test('CoreLogger throws StateError when not initialized', () {
      expect(() => CoreLogger().info('Test'), throwsA(isA<StateError>()));
      expect(() => CoreLogger().error('Test'), throwsA(isA<StateError>()));
      expect(() => CoreLogger().warning('Test'), throwsA(isA<StateError>()));
      expect(() => CoreLogger().fatal('Test'), throwsA(isA<StateError>()));
      expect(() => CoreLogger().trace('Test'), throwsA(isA<StateError>()));
      expect(() => CoreLogger().success('Test'), throwsA(isA<StateError>()));
    });
  });

  group('CoreLogger Initialized Tests', () {
    setUpAll(() async {
      // Initialize CoreLogger before running the tests
      await CoreLogger.initialize();
    });

    test('CoreLogger singleton instance', () {
      final logger1 = CoreLogger();
      final logger2 = CoreLogger();
      expect(logger1, equals(logger2));
    });

    test('logs information messages', () {
      final logger = CoreLogger();
      logger.info('This is an info message');
    });

    test('logs error messages', () {
      final logger = CoreLogger();
      logger.error('This is an error message', 'Error details');
    });

    test('logs warning messages', () {
      final logger = CoreLogger();
      logger.warning('This is a warning message', 'Warning details');
    });

    test('logs fatal messages', () {
      final logger = CoreLogger();
      logger.fatal('This is a fatal message', 'Fatal details');
    });

    test('logs trace messages', () {
      final logger = CoreLogger();
      logger.trace('This is a trace message', 'Trace details');
    });

    test('logs success messages', () {
      final logger = CoreLogger();
      logger.success('This is a success message');
    });
  });
}
