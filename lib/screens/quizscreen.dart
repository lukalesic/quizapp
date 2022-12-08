import 'package:flutter/material.dart';
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
//index for looping through questions
  int index = 0;
  bool isPressed = false;

  void nextQuestion() {
    setState(() {
      if (index == questions.length - 1) {
        return;
      } else {
        index++; //
      }
    });
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
              QuestionWidget(
                  indexAction: index,
                  question: questions[index].title,
                  totalQuestions: questions.length),
                  
              Table(
                children: [
                  TableRow(children: [
                    for (int i = 0; i < questions[index].answers.length; i++)
                      AnswerOption(
                          Id: questions[index].answers[i].Id,
                          movieTitle: questions[index].answers[i].movieTitle,
                          posterURL: questions[index].answers[i].posterURL,
                          correct: questions[index].answers[i].correct)
                  ])
                ],
              )
            ],
          )),
    );
  }
}
