
import 'dart:math';

import 'package:first_project/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isMale=true;
  double height=120;
  int weight=50,age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: isMale?Colors.blue:Colors.grey[400]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/male.png'),width: 90,height: 90,),
                            SizedBox(height: 20,),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: isMale?Colors.grey[400]:Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/female.png'),width: 90,height: 90,),
                            SizedBox(height: 20,),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
                ),
            ),

          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                    Slider(value: height,max: 220,min: 80, onChanged: (value){setState(() {
                      height=value;
                    });})

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(

                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                mini: true,
                              child: Icon(
                                Icons.remove,
                              ),
                                heroTag: 'Age-',
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                                heroTag: 'Age+',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WIGHT',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),
                                heroTag: 'weight-',
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                                heroTag: 'weght+',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: (){
                  var result=weight/pow(height/200, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder :(context)=>BmiResultScreen(
                            result: result.round(),
                            age: age,
                            gender: isMale?'MALE':'FEMALE',
                          ))
                  );
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                height: 45.0,
              )
          )


          ]
          )
      );
  }
}