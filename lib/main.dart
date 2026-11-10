import 'package:flutter/material.dart';
import 'EcomHomeScreen.dart' show EcomHomeScreen;

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      debugShowCheckedModeBanner: false,
      home: EcomHomeScreen(),
    );
  }
}