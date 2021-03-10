import 'package:flutter/material.dart';
import 'package:quizler/quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain brain = QuizBrain();

void main() {
  runApp(Quizler());
}

class Quizler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool answer) {
    setState(() {
      if (brain.isCorrect(answer)) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.clear,
            color: Colors.red,
          ),
        );
      }
    });
    if (brain.isFinished()) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Finished!",
        desc: "Yallah nod tgue3ad 3la slamtk.",
        buttons: [
          DialogButton(
            child: Text(
              "Retry",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                brain.reset();
                scoreKeeper.clear();
              });
            },
            width: 120,
          )
        ],
      ).show();
    }
    brain.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              brain.getCurrentQuestionText(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'Ka',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'Maka',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
