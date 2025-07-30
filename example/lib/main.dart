import 'package:core_logger/core_logger.dart';
import 'package:flutter/material.dart';

void main() async {
  // Initialize the logger before running the app
  await CoreLogger.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Core Logger Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Core Logger Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final logger = CoreLogger();
  int _counter = 0;
  String _lastLogMessage = '';

  void _demonstrateLogging() {
    setState(() {
      _counter++;

      // Demonstrate different log levels based on counter value
      switch (_counter % 6) {
        case 1:
          logger.info('Information log - Counter is now $_counter');
          _lastLogMessage = 'INFO: Counter incremented to $_counter';
          break;
        case 2:
          logger.success('Success log - Operation completed successfully!');
          _lastLogMessage = 'SUCCESS: Operation completed';
          break;
        case 3:
          logger.warning('Warning log - Counter is getting high: $_counter');
          _lastLogMessage = 'WARNING: Counter is at $_counter';
          break;
        case 4:
          logger.error(
            'Error log - Simulated error occurred',
            'Sample error details',
          );
          _lastLogMessage = 'ERROR: Simulated error with details';
          break;
        case 5:
          logger.trace('Trace log - Debug information for counter: $_counter');
          _lastLogMessage = 'TRACE: Debug info logged';
          break;
        case 0:
          logger.fatal(
            'Fatal log - Critical error simulation!',
            'Critical system failure',
          );
          _lastLogMessage = 'FATAL: Critical error logged';
          break;
      }
    });
  }

  void _checkInitialization() {
    setState(() {
      if (CoreLogger.isInitialized) {
        logger.info(
          'CoreLogger initialization check - Logger is properly initialized!',
        );
        _lastLogMessage = 'Initialization check: ✅ Initialized';
      } else {
        _lastLogMessage = 'Initialization check: ❌ Not initialized';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'CoreLogger Example',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Press the buttons below to test different log levels.\nCheck the console/debug output to see the logs.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Counter: $_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Last Log: $_lastLogMessage',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: _demonstrateLogging,
                    child: const Text('Test Logging'),
                  ),
                  ElevatedButton(
                    onPressed: _checkInitialization,
                    child: const Text('Check Initialization'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Log Types Demonstrated:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• INFO - General information'),
                  Text('• SUCCESS - Successful operations'),
                  Text('• WARNING - Warning messages'),
                  Text('• ERROR - Error messages with details'),
                  Text('• TRACE - Debug/trace information'),
                  Text('• FATAL - Critical error messages'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
