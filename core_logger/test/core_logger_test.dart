import 'package:core_logger/core_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoreLogger', () {
    setUp(() async {
      await CoreLogger.initialize();
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
