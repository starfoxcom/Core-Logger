# Core Logger

A simple and efficient Flutter package that provides a singleton logger wrapper around the popular `logger` package. Core Logger offers a clean, easy-to-use interface for logging throughout your Flutter application with consistent formatting and multiple log levels.

> **Note**: This is a local package not published to pub.dev. Use the local path dependency method to include it in your projects.

## Features

- **Singleton Pattern**: Access the same logger instance throughout your entire application
- **Multiple Log Levels**: Support for info, error, warning, fatal, trace, and success messages
- **Built on Logger Package**: Leverages the robust and popular `logger` package
- **Pretty Printing**: Formatted console output with colors and emojis for better readability
- **Easy Integration**: Simple initialization and usage with minimal setup
- **Type Safety**: Full Dart type safety with optional parameters for error objects and stack traces

## Getting started

Since this is a local package not published to pub.dev, you can add it to your project using either a local path dependency or a git dependency:

### Option 1: Local Path Dependency

Add it to your project's `pubspec.yaml` file using a local path:

```yaml
dependencies:
  flutter:
    sdk: flutter
  core_logger:
    path: ../path/to/core_logger  # Update with the actual path to this package
```

### Option 2: Git Dependency

Add it to your project's `pubspec.yaml` file using the git repository:

```yaml
dependencies:
  flutter:
    sdk: flutter
  core_logger:
    git:
      url: https://github.com/starfoxcom/Core-Logger.git
      # ref: main  # Optional: specify a branch, tag, or commit
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Setup

First, initialize the logger in your app's main function:

```dart
import 'package:core_logger/core_logger.dart';

void main() async {
  // Initialize the logger before using it
  await CoreLogger.initialize();
  
  runApp(MyApp());
}
```

### Logging Messages

Once initialized, you can use the logger anywhere in your application:

```dart
import 'package:core_logger/core_logger.dart';

class MyService {
  final logger = CoreLogger();
  
  void performOperation() {
    // Log information
    logger.info('Starting operation');
    
    try {
      // Your code here
      logger.success('Operation completed successfully');
    } catch (error, stackTrace) {
      // Log errors with optional error details and stack trace
      logger.error('Operation failed', error, stackTrace);
    }
  }
  
  void checkStatus() {
    // Log warnings
    logger.warning('This is a warning message');
    
    // Log trace information for debugging
    logger.trace('Debug trace information');
    
    // Log fatal errors
    logger.fatal('Critical system error');
  }
}
```

### Available Log Levels

- `logger.info(message, [response])` - Information messages
- `logger.error(message, [error, stackTrace])` - Error messages
- `logger.warning(message, [response])` - Warning messages
- `logger.fatal(message, [response, stackTrace])` - Fatal error messages
- `logger.trace(message, [response, stackTrace])` - Trace/debug messages
- `logger.success(message, [response])` - Success messages

## Additional information

This package provides a simple wrapper around the `logger` package with the following benefits:

- **Singleton pattern**: Ensures consistent logging configuration across your entire application
- **Customizable**: Built with pretty printing enabled by default with green debug colors and checkmark emojis
- **Flutter optimized**: Designed specifically for Flutter applications
- **Testing included**: Comprehensive test suite to ensure reliability

### Local Package Usage

Since this is a local package, you can:

1. **Clone or copy** this package to your local development environment
2. **Reference it** in your project's `pubspec.yaml` using a relative path
3. **Modify it** to suit your specific logging needs
4. **Version control** it alongside your project or as a separate repository

### Contributing

If you're using this package and want to contribute improvements:

1. Fork or clone the repository
2. Make your changes
3. Run the tests: `flutter test`
4. Submit your improvements
