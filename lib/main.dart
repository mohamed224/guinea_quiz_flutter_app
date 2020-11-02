import 'package:flutter/material.dart';

import 'guinea_quiz_screen.dart';

void main() {
  runApp(GuineaQuiz());
}

class GuineaQuiz extends StatefulWidget {
  @override
  _GuineaQuizState createState() => _GuineaQuizState();
}

class _GuineaQuizState extends State<GuineaQuiz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guinea Quiz',
        theme: ThemeData(
                primarySwatch: Colors.grey,
                accentColor: Colors.teal,
                fontFamily: 'Lato'),
      home: GuineaQuizScreen(),
    );
  }
}
