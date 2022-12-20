import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.indexAction,
      required this.question,
      required this.totalQuestions});

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Question ${indexAction + 1}/${totalQuestions}:',
          style: AppStyle.mainContent,
          textAlign: TextAlign.center,
        ),
        Text(
          question,
          style: AppStyle.mainTitle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
