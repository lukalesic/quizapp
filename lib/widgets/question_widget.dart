import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.indexAction,
      required this.question,
      required this.subject});

  final String question;
  final String subject;
  final int indexAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          question,
          style: AppStyle.mainContent,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          subject,
          style: AppStyle.mainTitle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
