import 'package:flutter/material.dart';
import 'screens/input_screen.dart';
import 'utils/constants.dart';

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
