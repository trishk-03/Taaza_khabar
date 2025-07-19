import 'package:flutter/material.dart';
import 'package:taaza_khabar/screens/onboarding_screen.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taaza Khabar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple, // Optional in dark mode
      ),
      themeMode: ThemeMode.system, // Switches based on device setting
      home: OnboardingScreen(),
    );

  }
}