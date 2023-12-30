import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({required this.correctAnswers, required this.wrongAnswers});

  final int correctAnswers;

  final int wrongAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("النتيجة"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "الإجابة الصحيحة: $correctAnswers ",
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "الإجابة الخاطئة: $wrongAnswers ",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
