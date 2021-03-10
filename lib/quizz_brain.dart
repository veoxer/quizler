import 'package:quizler/question.dart';

class QuizBrain {
  int currentQst = 0;

  List<Question> _questions = [
    Question('L9amar kidrab dora f 15jrs.', true),
    Question('LBa9ra kat9ol haw.', false),
    Question('Lmaghrib kayn fl\'europe.', false)
  ];

  String getCurrentQuestionText() {
    return _questions[currentQst].questionText;
  }

  bool isCorrect(bool answer) {
    return _questions[currentQst].answer == answer;
  }

  void nextQuestion() {
    if (currentQst < _questions.length - 1) currentQst++;
  }

  bool isFinished() {
    return currentQst == (_questions.length - 1);
  }

  void reset() {
    currentQst = 0;
  }
}
