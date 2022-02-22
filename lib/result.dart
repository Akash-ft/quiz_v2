import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import 'package:quiz_v2/main.dart';
import 'package:quiz_v2/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

class Result extends StatefulWidget {
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      quizBrain.getScore();
    });
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Score",
                        style: TextStyle(color: Colors.green, fontSize: 40),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        // call the value of score from the quizbrian and setting it Text widget.
                        quizBrain.getScore().toString(),

                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            //call the reset function from quizbrain
            quizBrain.reset();
            // this is navigator used to push the starting screen .
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Quiz()));
            // Navigator.pop(context);
          },
          child: Icon(
            Icons.cached,
            color: Colors.lightGreen,
            size: 30,
          ),
        ),
      ),
    );
  }
}
