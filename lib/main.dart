import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home.dart';
import 'screens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
      routes: {
        Home.routeName: (context) => const Home(),
        SignInScreen.routeName: (context) => const SignInScreen(),
      },
    );
  }
}
