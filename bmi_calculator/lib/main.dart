import 'package:flutter/material.dart';
import 'screens/gender_selection_screen.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: GenderSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

