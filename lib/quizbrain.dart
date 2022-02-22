import 'package:quiz_v2/question.dart';
// all the functionality used in code are in the quizbrain.

//Intial question index 0
int _q = 0;
//Intial score value 1 because we decrement the value by one in the condition.
int _score = 0;

class QuizBrain {
  //_questionbank is the object of question class
  // Since its  list we can store n number object of question class
  List<Question> _questionbank = [
    Question(question: "what 1 ?", answer: true),
    Question(question: "what 2 ?", answer: false),
    Question(question: "what 3 ?", answer: true),
    Question(question: "what 4 ?", answer: false),
    Question(question: "what 5 ?", answer: true),
    Question(question: "what 6 ?", answer: false),
    Question(question: "what 7 ?", answer: true),
    Question(question: "what 8 ?", answer: false),
    Question(question: "what 9 ?", answer: true),
    Question(question: "what 10 ?", answer: false),
    Question(question: "what 11 ?", answer: true),
    Question(question: "what 12 ?", answer: false),
  ];
  // Function to increment the score value
  int getScore() {
    return _score++;
  }

  //Convert the integer value to string to print the value in text widgets

  // void set score(score) => score;
  // get score => score;

  //This condition is used to check the end of the question
  bool? isFinished() => _q >= _questionbank.length - 1 ? true : false;
  // bool? isFinished() {
  //   if (_q >= _questionbank.length - 1) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  //This condition is used to increment the question index
  void nextNumber() {
    if (_q < _questionbank.length - 1) {
      _q++;
    }
  }

  //This condition is used to set the index of question and value of score to zero.
  void reset() {
    _q = 0;
    _score = 0;
  }

  //To fetch the value from the questionBank to check the trigger answer is ture or false.
  String getQuestionText() => _questionbank[_q].q;
  bool getCorrectAnswer() => _questionbank[_q].a;
}
