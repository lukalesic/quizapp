import 'package:flutter/material.dart';
import 'package:quizapp/models/questions_model.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:quizapp/widgets/poster_answer_view.dart';
import 'package:quizapp/widgets/question_widget.dart';

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
                  question: _questions[index].title,
                  totalQuestions: _questions.length),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const <Widget>[
                  Expanded(
                      child: PosterAnswerView(
                    id: 1,
                    title: 'Movie 1',
                    posterUrl:
                        'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                  )),
                  Expanded(
                    child: PosterAnswerView(
                      id: 1,
                      title: 'Movie 1',
                      posterUrl:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
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
                children: const <Widget>[
                  Expanded(
                    child: PosterAnswerView(
                      id: 3,
                      title: 'Movie 3',
                      posterUrl:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                    ),
                  ),
                  Expanded(
                    child: PosterAnswerView(
                      id: 4,
                      title: 'Movie 4',
                      posterUrl:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
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
