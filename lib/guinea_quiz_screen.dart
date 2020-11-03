import 'package:flutter/material.dart';

class GuineaQuizScreen extends StatefulWidget {
  @override
  _GuineaQuizScreenState createState() => _GuineaQuizScreenState();
}

class _GuineaQuizScreenState extends State<GuineaQuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  final quiz = [
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
      body: currentQuestion >= quiz.length
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Score : $score/10',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    height: 15,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentQuestion = 0;
                          score = 0;
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
                    padding: const EdgeInsets.only(top: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Question : ${currentQuestion + 1}/${quiz.length}",
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
                        quiz[currentQuestion]['title'],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      )),
                ),
                Container(
                  height: 30,
                ),
                ...(quiz[currentQuestion]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ++currentQuestion;
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
