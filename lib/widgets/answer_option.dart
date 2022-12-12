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


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    //  onTap: nextQuestion,
      child: InkWell(
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
            Image.network(posterURL),
            const SizedBox(height: 8),
            Text(
              movieTitle,
              style: AppStyle.mainContent,
            )
          ],
        ),
      ),
      ),
    );
  }
}