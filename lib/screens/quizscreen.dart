import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/screens/losescreen.dart';
import 'package:quizapp/screens/winnerscreen.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:quizapp/models/questions_model.dart';
import 'package:quizapp/widgets/answer_option.dart';
import 'package:quizapp/widgets/next_question_button.dart';
import 'package:quizapp/widgets/question_widget.dart';
import '../models/urls.dart';
import '../models/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  bool isPressed = false;
  int correctAnswers = 0;
  int timer = 10;
  String timerDisplay = "10";
  late Timer _timer;

  void nextQuestion(bool value) {
    setState(() {
      
          
      if (value == true) {
        if(timer + 3 >= 10){ timer = 10;}
        else{timer = timer + 3;} 
        correctAnswers++;
      }
      if (index == questions.length - 1) {
        //end of questions
        //cancel timer here
      
     _timer.cancel();

        Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => WinnerScreen(resultScore: correctAnswers,))));
        return;
      } else {
        index++;
      }
    });
  }

@override
  void initState(){
    timer = 10;
    startTimer();
    super.initState();
  }

  void startTimer() async{
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {

        setState(() {
          if(timer < 1){
            t.cancel();
            //here goes navigator for going to game over screen
            Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LoseScreen(resultScore: correctAnswers))));
          } else {
            timer = timer - 1;
          }
          timerDisplay = timer.toString();

        });

     });
  }

@override
void dispose() {
  _timer.cancel();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppStyle.accentColor,
      ),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Timer 
              Text(
                '$timerDisplay seconds left', 
                style: TextStyle(color: Colors.white),
              ),
              //Total score
              Text(
                'Result score: $correctAnswers/10',
                style: TextStyle(color: Colors.white),
              ),
              QuestionWidget(
                  indexAction: index,
                  question: questions[index].title,
                  totalQuestions: questions.length),
              Table(
                children: [
                  TableRow(children: [
                    for (int i = 0; i < questions[index].answers.length; i++)
                    
                      GestureDetector(
                          onTap: () =>
                          //if final quetion tapped, stop the timer, add parametar for "last"
                          
                              nextQuestion(questions[index].answers[i].correct),
                              
                          child: AnswerOption(
                              Id: questions[index].answers[i].Id,
                              movieTitle:
                                  questions[index].answers[i].movieTitle,
                              posterURL: questions[index].answers[i].posterURL,
                              correct: questions[index].answers[i].correct)),
                              
                  ])
                ],
              )
            ],
          )),
    );
  }
}
