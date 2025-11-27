//main.dart
import 'package:flutter/material.dart';
import 'ui/screens/welcome_screen.dart';
import 'ui/screens/temperature_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  // state: true = show welcome; false = show converter
  bool showWelcome = true;

  void _startConverter() {
    setState(() {
      showWelcome = false;
    });
  }

  void _goBackToWelcome() {
    setState(() {
      showWelcome = true;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Show Welcome or TemperatureScreen based on state
          child: showWelcome
              ? WelcomeScreen(onStart: _startConverter)
              // pass a callback if you want a back button in TemperatureScreen
              : TemperatureScreen(onBack: _goBackToWelcome),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}