import 'package:logger/logger.dart';

/// A [Logger] class for the core of a project.
class CoreLogger {
  /// Returns the singleton instance of [CoreLogger].
  factory CoreLogger() {
    return _instance;
  }

  /// Private constructor for singleton pattern.
  CoreLogger._internal();

  /// The singleton instance of [CoreLogger].
  static final CoreLogger _instance = CoreLogger._internal();

  /// The [Logger] instance used to log messages.
  late Logger _logger;

  /// Whether the [CoreLogger] has been initialized.
  static bool _isInitialized = false;

  /// Initializes the [Logger].
  ///
  /// This method should be called before using any other methods of [CoreLogger].
  ///
  /// Example:
  /// ```dart
  /// final logger = CoreLogger();
  ///
  /// // Don't forget to initialize the logger first before using the methods!
  /// logger.initialize();
  /// ```
  static Future<void> initialize() async {
    _instance._logger = Logger(
      printer: PrettyPrinter(
        levelColors: {Level.debug: const AnsiColor.fg(2)},
        levelEmojis: {Level.debug: '✅'},
      ),
    );
    _isInitialized = true;

    _instance.success('CoreLogger initialized!');
  }

  /// Checks if [CoreLogger] is initialized.
  ///
  /// Returns `true` if initialized, otherwise `false`.
  static bool get isInitialized => _isInitialized;

  /// Throws an exception if [CoreLogger] is not initialized.
  static void _ensureInitialized() {
    if (!_isInitialized) {
      throw StateError(
        'CoreLogger has not been initialized. Call CoreLogger.initialize() before using it.',
      );
    }
  }

  /// Logs an `information` message.
  ///
  /// This method is used for logging informational messages that are not errors or warnings.
  ///
  /// The [message] is the message to be logged.
  ///
  /// The [additionalContext] is an [Object] that can be provided for additional context.
  /// Providing this parameter would increase the stack trace information in the log.
  ///
  /// Example:
  /// ```dart
  /// // Don't forget to initialize the logger first!
  /// // Log an information message
  /// logger.info('This is an info message', 'Additional context');
  /// ```
  void info(String message, [Object? additionalContext]) {
    _ensureInitialized();
    _instance._logger.i(message, error: additionalContext);
  }

  /// Logs an `error` message.
  ///
  /// This method is used for logging error messages that should not be ignored.
  ///
  /// The [message] is the message to be logged.
  ///
  /// The [additionalErrorContext] is an [Object] that can be provided for additional error context.
  /// Providing this parameter would increase the stack trace information in the log.
  ///
  /// Example:
  /// ```dart
  /// // Don't forget to initialize the logger first!
  /// // Log an error message
  /// logger.error('This is an error message', 'Error details');
  /// ```
  void error(String message, [Object? additionalErrorContext]) {
    _ensureInitialized();
    _instance._logger.e(message, error: additionalErrorContext);
  }

  /// Logs a `warning` message.
  ///
  /// This method is used for logging warning messages that should not be ignored.
  ///
  /// The [message] is the message to be logged.
  ///
  /// The [additionalErrorContext] is an [Object] that can be provided for additional error context.
  /// Providing this parameter would increase the stack trace information in the log.
  ///
  /// Example:
  /// ```dart
  /// // Don't forget to initialize the logger first!
  /// // Log a warning message
  /// logger.warning('This is a warning message', 'Warning details');
  /// ```
  void warning(String message, [Object? additionalErrorContext]) {
    _ensureInitialized();
    _instance._logger.w(message, error: additionalErrorContext);
  }

  /// Logs a `fatal` message.
  ///
  /// Similar to `error`, but indicates a critical failure that should not be ignored.
  ///
  /// The [message] is the message to be logged.
  ///
  /// The [additionalErrorContext] is an [Object] that can be provided for additional error context.
  /// Providing this parameter would increase the stack trace information in the log.
  ///
  /// Example:
  /// ```dart
  /// // Don't forget to initialize the logger first!
  /// // Log a fatal error message
  /// logger.fatal('This is a fatal error message', 'Fatal details');
  /// ```
  void fatal(String message, [Object? additionalErrorContext]) {
    _ensureInitialized();
    _instance._logger.f(message, error: additionalErrorContext);
  }

  /// Logs a `trace` message.
  ///
  /// This method is used for logging debug or trace information.
  ///
  /// The [message] is the message to be logged.
  ///
  /// The [additionalContext] is an [Object] that can be provided for additional context.
  /// Providing this parameter would increase the stack trace information in the log.
  ///
  /// Example:
  /// ```dart
  /// // Don't forget to initialize the logger first!
  /// // Log a trace message
  /// logger.trace('This is a trace message');
  /// ```
  void trace(String message, [Object? additionalContext]) {
    _ensureInitialized();
    _instance._logger.t(message, error: additionalContext);
  }

  /// Logs a `success` message.
  ///
  /// This method is used for logging successful operations.
  ///
  /// The [message] is the message to be logged.
  ///
  /// The [additionalContext] is an [Object] that can be provided for additional context.
  /// Providing this parameter would increase the stack trace information in the log.
  ///
  /// Example:
  /// ```dart
  /// // Don't forget to initialize the logger first!
  /// // Log a success message
  /// logger.success('This is a success message', 'Success details');
  /// ```
  void success(String message, [Object? additionalContext]) {
    _ensureInitialized();
    _instance._logger.d(message, error: additionalContext);
  }
}
