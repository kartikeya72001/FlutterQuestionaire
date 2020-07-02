import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
// void main()
// {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _qIndex = 0;

  void _ansQues() {
    setState(() {
      if (_qIndex == 2)
        _qIndex = 0;
      else
        _qIndex++;
    });
    print(_qIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "What's Your Favourite Color?",
        'answers': [
          "Black",
          "Green",
          "White",
          "Red",
        ]
      },
      {
        'questionText': "What's Your Favourite Animal?",
        'answers': [
          "Lion",
          "Tiger",
          "Wolf",
          "Hare",
        ]
      },
      {
        'questionText': "What's Your Favourite Sport?",
        'answers': [
          "Cricket",
          "FootBall",
          "Golf",
          "Swimming",
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questionaire'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Question(questions[_qIndex]['questionText']), // or questions[i]
            ...(questions[_qIndex]['answers'] as List<String>).map((answer) {
              return Answer(_ansQues, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}