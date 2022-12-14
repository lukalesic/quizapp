import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';

class AnswerOption extends StatefulWidget {
  final int Id;
  final String movieTitle;
  final String posterURL;
  final bool correct;
  final OnAnsweredListener? listener;
  final bool clickable;

  const AnswerOption(
      {super.key,
      required this.Id,
      required this.movieTitle,
      required this.posterURL,
      required this.correct,
      required this.listener,
      required this.clickable});

  @override
  State<StatefulWidget> createState() => _AnswerOptionState();
}

class _AnswerOptionState extends State<AnswerOption> {
  bool clicked = false;

  static RoundedRectangleBorder borderRadius =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: borderRadius,
        borderOnForeground: true,
        color: getAnswerColor(),
        child: InkWell(
            onTap: () {
              if (widget.clickable) {
                setState(() {
                  clicked = true;
                });
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    clicked = false;
                  });
                });
                widget.listener?.onQuestionAnswered(widget.correct);
              }
            },
            customBorder: borderRadius,
            child: Container(
                padding: const EdgeInsets.all(8),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Column(
                    children: [
                      Image.network(
                        widget.posterURL,
                        scale: 2,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.movieTitle,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.posterTitle,
                      )
                    ],
                  ),
                ))));
  }

  Color getAnswerColor() {
    if (clicked) {
      if (widget.correct) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return AppStyle.cardColor;
    }
  }
}

abstract class OnAnsweredListener {
  void onQuestionAnswered(bool isCorrect);
}
