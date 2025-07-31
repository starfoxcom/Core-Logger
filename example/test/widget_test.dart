// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:core_logger/core_logger.dart';
import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoreLogger Example Widget Tests', () {
    setUpAll(() async {
      // Initialize CoreLogger before running the tests
      await CoreLogger.initialize();
    });

    testWidgets('App displays correct title and initial state', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the app title is correct.
      expect(find.text('Core Logger Example'), findsOneWidget);

      // Verify that the counter starts at 0.
      expect(find.text('Counter: 0'), findsOneWidget);

      // Verify that the initial log message is empty.
      expect(find.text('Last Log: '), findsOneWidget);

      // Verify that both buttons are present.
      expect(find.text('Test Logging'), findsOneWidget);
      expect(find.text('Check Initialization'), findsOneWidget);
    });

    testWidgets(
      'Test Logging button increments counter and updates log message',
      (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(const MyApp());

        // Verify initial state.
        expect(find.text('Counter: 0'), findsOneWidget);

        // Tap the 'Test Logging' button and trigger a frame.
        await tester.tap(find.text('Test Logging'));
        await tester.pump();

        // Verify that the counter has incremented.
        expect(find.text('Counter: 1'), findsOneWidget);
        expect(find.text('Counter: 0'), findsNothing);

        // Verify that a log message was updated (should show INFO message for counter 1).
        expect(
          find.text('Last Log: INFO: Counter incremented to 1'),
          findsOneWidget,
        );
      },
    );

    testWidgets('Check Initialization button works correctly', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Tap the 'Check Initialization' button and trigger a frame.
      await tester.tap(find.text('Check Initialization'));
      await tester.pump();

      // Verify that initialization check message appears.
      expect(
        find.text('Last Log: Initialization check: ✅ Initialized'),
        findsOneWidget,
      );
    });

    testWidgets('Multiple button presses cycle through different log levels', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Test first press - should show INFO
      await tester.tap(find.text('Test Logging'));
      await tester.pump();
      expect(find.text('Counter: 1'), findsOneWidget);
      expect(
        find.text('Last Log: INFO: Counter incremented to 1'),
        findsOneWidget,
      );

      // Test second press - should show SUCCESS
      await tester.tap(find.text('Test Logging'));
      await tester.pump();
      expect(find.text('Counter: 2'), findsOneWidget);
      expect(
        find.text('Last Log: SUCCESS: Operation completed'),
        findsOneWidget,
      );

      // Test third press - should show WARNING
      await tester.tap(find.text('Test Logging'));
      await tester.pump();
      expect(find.text('Counter: 3'), findsOneWidget);
      expect(find.text('Last Log: WARNING: Counter is at 3'), findsOneWidget);

      // Test fourth press - should show ERROR
      await tester.tap(find.text('Test Logging'));
      await tester.pump();
      expect(find.text('Counter: 4'), findsOneWidget);
      expect(
        find.text('Last Log: ERROR: Simulated error with details'),
        findsOneWidget,
      );

      // Test fifth press - should show TRACE
      await tester.tap(find.text('Test Logging'));
      await tester.pump();
      expect(find.text('Counter: 5'), findsOneWidget);
      expect(find.text('Last Log: TRACE: Debug info logged'), findsOneWidget);

      // Test sixth press - should show FATAL
      await tester.tap(find.text('Test Logging'));
      await tester.pump();
      expect(find.text('Counter: 6'), findsOneWidget);
      expect(
        find.text('Last Log: FATAL: Critical error logged'),
        findsOneWidget,
      );
    });

    testWidgets('UI elements are properly displayed', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify main UI elements are present.
      expect(find.text('CoreLogger Example'), findsOneWidget);
      expect(
        find.text(
          'Press the buttons below to test different log levels.\nCheck the console/debug output to see the logs.',
        ),
        findsOneWidget,
      );
      expect(find.text('Log Types Demonstrated:'), findsOneWidget);
      expect(find.text('• INFO - General information'), findsOneWidget);
      expect(find.text('• SUCCESS - Successful operations'), findsOneWidget);
      expect(find.text('• WARNING - Warning messages'), findsOneWidget);
      expect(
        find.text('• ERROR - Error messages with details'),
        findsOneWidget,
      );
      expect(find.text('• TRACE - Debug/trace information'), findsOneWidget);
      expect(find.text('• FATAL - Critical error messages'), findsOneWidget);
    });
  });
}
