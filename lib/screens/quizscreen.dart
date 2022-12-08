import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:quizapp/models/questions_model.dart';
import 'package:quizapp/widgets/answer_option.dart';
import 'package:quizapp/widgets/next_question_button.dart';
import 'package:quizapp/widgets/question_widget.dart';
import '../models/urls.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> _questions = [
    Question(
        id: '1',
        title: 'Question 1',
        answers: {'a': false, 'b': false, 'c': true, 'd': false}),
    Question(
        id: '2',
        title: 'Question 1',
        answers: {'a': false, 'b': false, 'c': true, 'd': false}),
    Question(
        id: '3',
        title: 'Question 1',
        answers: {'a': false, 'b': false, 'c': true, 'd': false})
  ];

//index for looping through questions
  int index = 0;
  bool isPressed = false;

  void nextQuestion() {
    setState(() {
      if (index == _questions.length - 1) {
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
                  question: _questions[index].title,
                  totalQuestions: _questions.length),
              Table(
                children: [
                  TableRow(children: [
                    AnswerOption(
                        Id: '1',
                        nextQuestion: nextQuestion,
                        movieTitle: 'Title 1',
                        posterURL: URLs[0]),
                    AnswerOption(
                        Id: '2',
                        nextQuestion: nextQuestion,
                        movieTitle: 'Title 2',
                        posterURL: URLs[1]),
                  ]),
                  TableRow(children: [
                    AnswerOption(
                        Id: '3',
                        nextQuestion: nextQuestion,
                        movieTitle: 'Title 3',
                        posterURL: URLs[2]),
                    AnswerOption(
                        Id: '4',
                        nextQuestion: nextQuestion,
                        movieTitle: 'Title 4',
                        posterURL: URLs[3]),
                  ])
                ],
              )
            ],
          )),
    );
  }
}
