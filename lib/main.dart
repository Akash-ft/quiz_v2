import 'package:flutter/material.dart';
import 'package:quiz_v2/quizbrain.dart';
import 'package:quiz_v2/result.dart';

//quizBrain is the object of class QuizBrain.
QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  // list to generate icon if its right or wrong
  List<Icon> rOrl = [];
  // function to check the answer is right or wrong.
  void checkAnswer(bool answerPicked) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        //If the condition is true ,its pushes to the result screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Result()));
      } else {
        // answerPicked ==correctAnswer ?
        //   rOrl.add(
        //     Icon(
        //       Icons.check,
        //       color: Colors.green,
        //     ),
        //   ) :
        //   rOrl.add(
        //     Icon(
        //       Icons.close,
        //       color: Colors.red,
        //     ),
        //   );
        // }

        if (answerPicked == correctAnswer) {
          rOrl.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          quizBrain.getScore();
        } else {
          rOrl.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        //this condition is used to fetch the next question
        quizBrain.nextNumber();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                // bool correctAnswer = quizBrain.getCorrectAnswer();
                // setState(() {
                //   if (correctAnswer == true) {
                //     print("The answer is right");
                //     rOrl.add(
                //       Icon(
                //         Icons.check,
                //         color: Colors.green,
                //       ),
                //     );
                //   } else {
                //     print("The answer is wrong");
                //     rOrl.add(
                //       Icon(
                //         Icons.close,
                //         color: Colors.red,
                //       ),
                //     );
                //   }
                //
                //   quizBrain.nextNumber();
                // });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
                // bool correctAnswer = quizBrain.getCorrectAnswer();
                // setState(() {
                //   if (correctAnswer == false) {
                //     print("The answer is right");
                //     rOrl.add(
                //       Icon(
                //         Icons.check,
                //         color: Colors.green,
                //       ),
                //     );
                //   } else {
                //     print("The answer is wrong");
                //     rOrl.add(
                //       Icon(
                //         Icons.close,
                //         color: Colors.red,
                //       ),
                //     );
                //     quizBrain.nextNumber();
                //   }
                // });
              },
            ),
          ),
        ),
        Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: rOrl,
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
