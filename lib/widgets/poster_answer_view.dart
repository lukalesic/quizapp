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

  static RoundedRectangleBorder borderRadius =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: borderRadius,
        borderOnForeground: true,
        color: AppStyle.cardColor,
        child: InkWell(
            onTap: () {
              // handle answering a question
            },
            customBorder: borderRadius,
            child: Container(
                padding: const EdgeInsets.all(8),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Column(
                    children: [
                      Image.network(
                        posterUrl,
                        scale: 2,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.mainContent,
                      )
                    ],
                  ),
                ))));
  }
}
