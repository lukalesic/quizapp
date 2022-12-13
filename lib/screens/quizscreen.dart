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

class _QuizScreenState extends State<QuizScreen> implements OnAnsweredListener {
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
                    Id: questions[index].answers[0].id,
                    movieTitle: questions[index].answers[0].original_title,
                    posterURL: questions[index].answers[0].photo,
                    correct: questions[index].answers[0].is_answer,
                    listener: this,
                  )),
                  Expanded(
                    child: AnswerOption(
                      Id: questions[index].answers[1].id,
                      movieTitle: questions[index].answers[1].original_title,
                      posterURL: questions[index].answers[1].photo,
                      correct: questions[index].answers[1].is_answer,
                      listener: this,
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
                      Id: questions[index].answers[2].id,
                      movieTitle: questions[index].answers[2].original_title,
                      posterURL: questions[index].answers[2].photo,
                      correct: questions[index].answers[2].is_answer,
                      listener: this,
                    ),
                  ),
                  Expanded(
                    child: AnswerOption(
                      Id: questions[index].answers[3].id,
                      movieTitle: questions[index].answers[3].original_title,
                      posterURL: questions[index].answers[3].photo,
                      correct: questions[index].answers[3].is_answer,
                      listener: this,
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

  @override
  void onQuestionAnswered(bool isCorrect) {
    nextQuestion(isCorrect);
  }
}
