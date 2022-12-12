import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:quizapp/widgets/answer_option.dart';
import 'package:quizapp/widgets/question_widget.dart';
import '../models/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

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
