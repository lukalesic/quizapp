import 'package:flutter/material.dart';
import 'package:quizapp/style/appstyle.dart';
import 'package:transparent_image/transparent_image.dart';

class AnswerOption extends StatefulWidget {
  final int Id;
  final String movieTitle;
  final String posterURL;
  final bool correct;
  final OnAnsweredListener? listener;
  final bool clickable;
  final bool highlightAnswer;

  const AnswerOption(
      {super.key,
      required this.Id,
      required this.movieTitle,
      required this.posterURL,
      required this.correct,
      required this.listener,
      required this.clickable,
      required this.highlightAnswer});

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
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Container(
                        child: Card(
                          child: FadeInImage.memoryNetwork(
                            imageErrorBuilder: (_, __, ___) {
                              return Image.memory(kTransparentImage);
                            },
                            fadeInCurve: Curves.easeInOut,
                            placeholder: kTransparentImage,
                            image: widget.posterURL,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        addNewLine(widget.movieTitle),
                        style: AppStyle.posterTitle,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                      )
                    ],
                  ),
                ))));
  }

  Color getAnswerColor() {
    if (widget.highlightAnswer && widget.correct) {
      return Colors.green;
    } else if (clicked) {
      if (widget.correct) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return AppStyle.cardColor;
    }
  }

  String addNewLine(String text) {
    if (text.length < 35) {
      return text;
    } else {
      List<String> words = text.split(" ");
      words.insert(words.length ~/ 2, "\n");
      return words.join(" ");
    }
  }
}

abstract class OnAnsweredListener {
  void onQuestionAnswered(bool isCorrect);
}
