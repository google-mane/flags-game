import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:game_the_flag/ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen();

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Monaco",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "UK",
    "US",
  ];

  List<Color> BacckgrounddColor = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.cyanAccent,
    Colors.deepOrange,
    Colors.deepPurple
  ];


  int num = Random().nextInt(3);

  int a = 0;

  int b = 1;

  int correctAnswers = 0;

  int wrongAnswers = 0 ;

  @override
  void initState() {
    countries.shuffle();

    super.initState();

    BacckgrounddColor.shuffle();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BacckgrounddColor[a],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                "وشو العلم ؟",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                countries[num],
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              for (int i = 0; i < 3; i++)
                FlagButton(
                  name: countries[i],
                  onPressed: () {
                    if (i == num) {
                      Fluttertoast.showToast(
                          msg: 'صح عليك', backgroundColor: Colors.green);
                      correctAnswers++;
                    } else {
                      Fluttertoast.showToast(
                          msg: 'غلط يا حمار', backgroundColor: Colors.red);
                      wrongAnswers++;
                    }
                    setState(
                      () {
                        if (b == 3) {
                          b = 0;
                          if (a == 6) {
                            a = 0;
                            BacckgrounddColor.shuffle();
                          } else {
                            a++;
                          }
                        }
                        b++;

                        countries.shuffle();
                        num = Random().nextInt(3);
                      },
                    );
                  },
                ),
              Padding(
                padding: const EdgeInsets.all(8.0*3),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(correctAnswers: correctAnswers,wrongAnswers: wrongAnswers,)
                  ));
                }, child: Text('النتيجة')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlagButton extends StatelessWidget {
  const FlagButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 270,
        height: 150,
        color: Color(-2080374784),
        child: TextButton(
            onPressed: onPressed,
            child: Image.asset(
              "assets/countries/$name.png",
              height: 150,
            )),
      ),
    );
  }
}
