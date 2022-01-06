
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget{
  final int result,age;
  final String gender;

  BmiResultScreen({
    required this.result,
    required this.age,
    required this.gender,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${gender}',
              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            ),
            Text(
              'Result : ${result}',
              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            ),
            Text(
              'Age : ${age}',
              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

}