import 'package:bmi_calculator/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  MyApp app= MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:HomeScreen()
    );
  }
}




