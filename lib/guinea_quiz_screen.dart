import 'dart:async';

import 'package:flutter/material.dart';

class GuineaQuizScreen extends StatefulWidget {
  @override
  _GuineaQuizScreenState createState() => _GuineaQuizScreenState();
}

class _GuineaQuizScreenState extends State<GuineaQuizScreen> {
  int _currentQuestion = 0;
  int score = 0;
  int _minute = 0;
  Timer _timer;
  int _counter = 0;
  String _timeElapsed = '';
  bool _isStarted = true;
  final _quiz = [
    {
      'title': 'En Guinée, le président est élu pour :',
      'answers': [
        {'answer': '10 ans', 'correct': false, 'points': 0},
        {'answer': '5 ans', 'correct': true, 'point': 1},
        {'answer': '3 ans', 'correct': false, 'points': 0},
      ]
    },
    {
      'title': 'Comment s\'appelle le président de la 3ème République ?',
      'answers': [
        {'answer': 'Alpha Condé', 'correct': true, 'point': 1},
        {'answer': 'Cellou Dalein Diallo', 'correct': false, 'points': 0},
        {'answer': 'Moussa Dadis Camara', 'correct': false, 'points': 0},
      ]
    },
    {
      'title': 'Quelle est la superficie de la Guinée en kilomètres carrés ?',
      'answers': [
        {'answer': '34576899', 'correct': false, 'points': 0},
        {'answer': '245857', 'correct': true, 'point': 2},
        {'answer': '1000556', 'correct': false, 'points': 0},
      ]
    },
    {
      'title': 'En quelle année la Guinée a-t-elle eu son indépendance ?',
      'answers': [
        {'answer': 'En 1958', 'correct': true, 'point': 2},
        {'answer': 'En 1960', 'correct': false, 'points': 0},
        {'answer': 'En 1940', 'correct': false, 'points': 0},
      ]
    },
    {
      'title': 'Quel est le plus haut sommet du pays ?',
      'answers': [
        {'answer': 'Mont Nimba', 'correct': true, 'point': 2},
        {'answer': 'Mont Loura', 'correct': false, 'points': 0},
        {'answer': 'Mont Kakoulima', 'correct': false, 'points': 0},
      ]
    },
    {
      'title': 'Quelle langue officielle parlent les Guinéens ?',
      'answers': [
        {'answer': 'L\'espagnol', 'correct': false, 'point': 0},
        {'answer': 'L\'anglais', 'correct': false, 'point': 0},
        {'answer': 'Le français', 'correct': true, 'point': 1},
      ]
    },
    {
      'title':
          'Parmi ces noms, lequel est celui de la ministre de la défense ?',
      'answers': [
        {'answer': 'Mme Christine Sagno', 'correct': false, 'point': 0},
        {'answer': 'Dr Diane', 'correct': true, 'point': 1},
        {'answer': 'Rebecca', 'correct': false, 'point': 0},
      ]
    }
  ];

  String _formatTime() {
    return "${_minute < 10 ? "0$_minute" : _minute}:"
        "${_counter < 10 ? "0$_counter" : _counter}";
  }

  _startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentQuestion >= 1 && _currentQuestion < _quiz.length) {
          _counter++;

          if (_counter == 60) {
            _minute++;
            _counter = 0;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.red,
        elevation: 0.5,
        title: Text("Quiz Guinée"),
        centerTitle: true,
        actions: [
          Container(
            child: Icon(Icons.language),
            margin: const EdgeInsets.symmetric(horizontal: 10),
          )
        ],
      ),
      body: _currentQuestion >= _quiz.length
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Temps ecoulé = $_timeElapsed',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    height: 15,
                  ),
                  Text('Score = $score/10',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    height: 15,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentQuestion = 0;
                          score = 0;
                          _counter = 0;
                          _minute = 0;
                          _timeElapsed = '';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green),
                        child: Text(
                          'Voulez-vous rejouer?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Column(
              children: [
                Center(
                    child: Container(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(
                          _formatTime(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ))),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Question : ${_currentQuestion + 1}/${_quiz.length}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _quiz[_currentQuestion]['title'],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      )),
                ),
                Container(
                  height: 30,
                ),
                ...(_quiz[_currentQuestion]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Container(
                    child: InkWell(
                      onTap: () {
                        if (_isStarted) {
                          _startTimer();
                          _isStarted = false;
                        }
                        setState(() {
                          ++_currentQuestion;
                          _timeElapsed = _formatTime();
                          if (answer['correct']) {
                            score += answer['point'];
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow),
                        child: Text(
                          answer['answer'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
    );
  }
}
