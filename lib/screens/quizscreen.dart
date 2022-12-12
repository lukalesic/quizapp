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
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  bool isPressed = false;
  int correctAnswers = 0;
  int timer = 10;
  String timerDisplay = "10";

  void nextQuestion(bool value) {
    setState(() {
      if(timer + 3 >= 10){ timer = 10;}
      else{timer = timer + 3;}
      if (value == true) {
        correctAnswers++;
      }
      if (index == questions.length - 1) {
        //end of questions
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
    startTimer();
    super.initState();
  }

  void startTimer() async{
    Timer.periodic(Duration(seconds: 1), (Timer t) {

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppStyle.accentColor,
      ),
      backgroundColor: AppStyle.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
            Expanded(
              flex: 1,
              child: QuestionWidget(
                  indexAction: index,
                  question: questions[index].title,
                  totalQuestions: questions.length),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: AnswerOption(
                    Id: '1',
                    movieTitle: 'Movie 1',
                    posterURL:
                        'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                    correct: false,
                  )),
                  Expanded(
                    child: AnswerOption(
                      Id: '1',
                      movieTitle: 'Movie 1',
                      posterURL:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                      correct: false,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: AnswerOption(
                      Id: '3',
                      movieTitle: 'Movie 3',
                      posterURL:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                      correct: false,
                    ),
                  ),
                  Expanded(
                    child: AnswerOption(
                      Id: '4',
                      movieTitle: 'Movie 4',
                      posterURL:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                      correct: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
