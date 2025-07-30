import 'package:logger/logger.dart';

/// A logger class for the core of a project.
class CoreLogger {
  /// Returns the singleton instance of `CoreLogger`.
  factory CoreLogger() {
    return _instance;
  }

  /// Private constructor for singleton pattern.
  CoreLogger._internal();

  /// The singleton instance of the logger.
  static final CoreLogger _instance = CoreLogger._internal();

  /// The logger instance used to log messages.
  late Logger _logger;

  /// Whether the logger has been initialized.
  static bool _isInitialized = false;

  /// Initializes the logger.
  ///
  /// This method should be called before using any other methods of the logger.
  static Future<void> initialize() async {
    _instance._logger = Logger(
      printer: PrettyPrinter(
        levelColors: {Level.debug: const AnsiColor.fg(2)},
        levelEmojis: {Level.debug: '✅'},
      ),
    );
    _isInitialized = true;
  }

  /// Checks if the logger is initialized.
  ///
  /// Returns `true` if the logger has been initialized, `false` otherwise.
  static bool get isInitialized => _isInitialized;

  /// Throws an exception if the logger is not initialized.
  static void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'CoreLogger has not been initialized. Call CoreLogger.initialize() before using the logger.',
      );
    }
  }

  /// Logs an information message.
  ///
  /// The `message` parameter is the message to be logged.
  /// The `response` parameter is an optional response object.
  void info(String message, [Object? response]) {
    _ensureInitialized();
    _instance._logger.i(message, error: response);
  }

  /// Logs an error message.
  ///
  /// The `message` parameter is the message to be logged.
  /// The `error` parameter is an optional error object.
  /// The `stackTrace` parameter is an optional stack trace.
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _ensureInitialized();
    _instance._logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Logs a warning message.
  ///
  /// The `message` parameter is the message to be logged.
  /// The `response` parameter is an optional response object.
  void warning(String message, [Object? response]) {
    _ensureInitialized();
    _instance._logger.w(message, error: response);
  }

  /// Logs a fatal error message.
  ///
  /// The `message` parameter is the message to be logged.
  /// The `response` parameter is an optional response object.
  /// The `stackTrace` parameter is an optional stack trace.
  void fatal(String message, [Object? response, StackTrace? stackTrace]) {
    _ensureInitialized();
    _instance._logger.f(message, error: response, stackTrace: stackTrace);
  }

  /// Logs a trace message.
  ///
  /// The `message` parameter is the message to be logged.
  /// The `response` parameter is an optional response object.
  /// The `stackTrace` parameter is an optional stack trace.
  void trace(String message, [Object? response, StackTrace? stackTrace]) {
    _ensureInitialized();
    _instance._logger.t(message, error: response, stackTrace: stackTrace);
  }

  /// Logs a success message.
  ///
  /// The `message` parameter is the message to be logged.
  /// The `response` parameter is an optional response object.
  void success(String message, [Object? response]) {
    _ensureInitialized();
    _instance._logger.d(message, error: response);
  }
}
