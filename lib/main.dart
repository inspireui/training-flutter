import 'package:flutter/material.dart';

import 'src/features/onboarding/onboarding_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const OnboardingScreen(),
    theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: const Color(0xFF101010),
            textStyle: const TextStyle(fontSize: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
        // outlinedButtonTheme: OutlinedButtonTheme(data: data, child: child),
        textTheme: const TextTheme(
          headline3: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.red,
          ),
          headline2: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        )),
  ));
}
