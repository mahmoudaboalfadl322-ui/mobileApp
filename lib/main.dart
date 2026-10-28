import 'package:flutter/material.dart';
import 'input_screen.dart';

const Color kBgColor = Color(0xFF0A0E21);
const Color kActiveCardColor = Color(0xFF1D1E33);
const Color kInactiveCardColor = Color(0xFF111328);
const Color kAccentColor = Color(0xFF00E5FF);
const Color kTextColor = Color(0xFFB0BEC5);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Tracker',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBgColor,
      ),
      home: const InputScreen(),
    );
  }
}
