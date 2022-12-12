import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';

class AnswerOption extends StatelessWidget {

    final String Id; 
    final String movieTitle;
    final String posterURL;
    final bool correct;
    

    const AnswerOption({super.key,
     required this.Id,
     required this.movieTitle,
     required this.posterURL,
     required this.correct
     });

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
                        posterURL,
                        scale: 2,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movieTitle,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.mainContent,
                      )
                    ],
                  ),
                ))));
  }
}
