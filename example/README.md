# Core Logger Example

This example app demonstrates how to use the CoreLogger package in a Flutter application.

## Features Demonstrated

- **Logger Initialization**: Shows how to properly initialize CoreLogger before using it
- **All Log Levels**: Demonstrates all six log levels (info, success, warning, error, trace, fatal)
- **Initialization Check**: Shows how to verify if CoreLogger is properly initialized
- **Real-world Usage**: Provides practical examples of when to use each log level

## How to Run

1. Make sure you're in the example directory:
   ```bash
   cd example
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## What You'll See

- **Test Logging Button**: Cycles through all log levels with each press
- **Check Initialization Button**: Verifies that CoreLogger is properly initialized
- **Counter Display**: Shows current counter value and last log message
- **Log Types List**: Reference for all available log levels

## Console Output

When you press the buttons, you'll see formatted log messages in your debug console with:
- **Colors and Emojis**: Pretty formatted output for better readability
- **Timestamps**: When each log was generated
- **Log Levels**: Clear indication of message severity
- **Message Details**: The actual log content and any additional data

## Code Highlights

### Initialization
```dart
void main() async {
  // Initialize the logger before running the app
  await CoreLogger.initialize();
  runApp(const MyApp());
}
```

### Usage
```dart
final logger = CoreLogger();

// Different log levels
logger.info('Information message');
logger.success('Success message');
logger.warning('Warning message');
logger.error('Error message', errorObject, stackTrace);
logger.trace('Debug trace message');
logger.fatal('Critical error message');
```

### Initialization Check
```dart
if (CoreLogger.isInitialized) {
  // Safe to use logger
  logger.info('Logger is ready!');
} else {
  // Handle uninitialized state
  print('Logger not initialized');
}
```

This example serves as a practical reference for integrating CoreLogger into your own Flutter applications.
