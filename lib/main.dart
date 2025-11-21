import 'package:flutter/material.dart';
import 'package:task_one_figma/screens/onboarding/onboarding_screen.dart';
import 'package:task_one_figma/screens/login/login_screen.dart';

void main() {
  runApp(const GravityApp());
}

class GravityApp extends StatelessWidget {
  const GravityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gravity Wellness App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Define the routes for navigation
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/signin': (context) => const SignInScreen(),
      },

      // Start with the Onboarding flow
      initialRoute: '/',
    );
  }
}