import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:quizapp/models/questions_model.dart';
import 'package:quizapp/widgets/next_question_button.dart';
import 'package:quizapp/widgets/poster_answer_view.dart';
import 'package:quizapp/widgets/question_widget.dart';
import 'package:quizapp/widgets/option_card.dart';

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

void nextQuestion(){
  setState(() {
    if(index== _questions.length - 1){ 
      return;
      }
      else {
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
                children: const [
                  TableRow(children: [
                    PosterAnswerView(
                      id: 1,
                      title: 'Movie 1',
                      posterUrl:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                    ),
                    PosterAnswerView(
                      id: 2,
                      title: 'Movie 2',
                      posterUrl:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                    )
                  ]),
                  TableRow(children: [
                    PosterAnswerView(
                      id: 3,
                      title: 'Movie 3',
                      posterUrl:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                    ),
                    PosterAnswerView(
                      id: 4,
                      title: 'Movie 4',
                      posterUrl:
                          'https://d3sourxycqfpzg.cloudfront.net/production/infos/posters/658032/small.jpg',
                    )
                  ])
                ],
              )
            ],
          )),
    );
  }
}
