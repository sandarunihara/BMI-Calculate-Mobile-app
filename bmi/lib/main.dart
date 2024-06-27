import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int height = 150;
  int weight = 50;
  String a = '';
  late double bbm = bmi(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Male");
                        setState(() {
                          a = 'm';
                        });
                        
                      },
                      child: Container(
                        color: a=='m'? Colors.blue:Colors.black12,
                        child: Column(
                          children: [
                            Icon(Icons.male, size: 150),
                            Text("MALE"),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print("Female");
                        setState(() {
                           a = 'f';
                        });
                       
                      },
                      child: Container(
                        color: a=='f'? Colors.blue:Colors.black12,
                        child: Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 150,
                            ),
                            Text("FEMALE"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Height"),
                        Text(
                          "$height",
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  height++;
                                  bbm = bmi(height: height, weight: weight);
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) {
                                    height--;
                                    bbm = bmi(height: height, weight: weight);
                                  }
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text("Weight"),
                        Text(
                          "$weight",
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  bbm = bmi(height: height, weight: weight);
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) {
                                    weight--;
                                    bbm = bmi(height: height, weight: weight);
                                  }
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${bbm.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double bmi({required height, required weight}) {
    return weight / (height / 100 * height / 100);
  }
}
