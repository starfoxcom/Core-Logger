# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.2] - 2025-07-30

### Added
- BSD 3-Clause License with proper copyright attribution to Jorge Alexandro Zamudio Arredondo
- Created CHANGELOG.md to track changes and updates

### Changed
- Enhanced README documentation with link to the logger package
- Updated package version to 1.1.2 to reflect the addition of the license, changelog, and documentation improvements

## [1.1.1] - 2025-07-30

### Changed
- Updated package description to better reflect its functionality
- Enhanced the example app description to highlight its features
- Improved package version to 1.1.1
- Enhanced README documentation with comprehensive usage examples

### Added
- Better pubspec.yaml descriptions for both main package and example app

## [1.1.0] - 2025-07-30

### Added
- Comprehensive CoreLogger package documentation
- Enhanced parameter naming with `additionalContext` and `additionalErrorContext`
- Example Flutter app for core logger package demonstration
- Interactive logging demonstration with real-time UI feedback
- Widget tests to verify the app's functionality
- Initialization checking functionality with `CoreLogger.isInitialized`
- Automatic initialization logging when logger is initialized

### Changed
- Updated package version from 0.0.1 to 1.1.0 indicating a stable release
- Enhanced CoreLogger initialization with better error handling
- Improved documentation comments using proper Dart syntax
- Simplified API with better parameter names

### Fixed
- Flag to track initialization status to prevent usage before initialization
- Enhanced error handling with descriptive StateError messages

## [0.0.1] - Initial Release

### Added
- Initial CoreLogger package implementation
- Singleton pattern for consistent logging across application
- Six log levels: info, error, warning, fatal, trace, and success
- Integration with `logger` package for robust logging foundation
- Pretty printing with colors and emojis for better readability
- Type safety with optional parameters for error objects and stack traces
- Basic project structure and dependencies
- Flutter package boilerplate and configuration

### Features
- **Singleton Pattern**: Access the same logger instance throughout entire application
- **Multiple Log Levels**: Support for different severity levels with appropriate formatting
- **Built on Logger Package**: Leverages the robust and popular `logger` package
- **Pretty Printing**: Formatted console output with colors and emojis
- **Easy Integration**: Simple initialization and usage with minimal setup
- **Type Safety**: Full Dart type safety with optional parameters
