import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';

class PosterAnswerView extends StatelessWidget {
  final int id;
  final String title;
  final String posterUrl;

  const PosterAnswerView(
      {super.key,
      required this.id,
      required this.title,
      required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // handle answering a question
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: AppStyle.borderColor, width: 0.3),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            Image.network(posterUrl),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppStyle.mainContent,
            )
          ],
        ),
      ),
    );
  }
}
