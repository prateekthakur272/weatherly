import 'package:flutter/material.dart';
import 'package:weatherly/constants/themes.dart';
import 'package:weatherly/screens/home_screen/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}