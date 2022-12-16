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

          /*            Image.network(widget.posterURL, frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                        return child;
                      },
                      loadingBuilder: ((context, child, loadingProgress) {
                          if(loadingProgress==null){return child;}
                          else {
                            return Center(
                             child: Container(color: Colors.grey, height: 120,),
                            );
                          }
                      }),
                      ),*/


                      FadeInImage.memoryNetwork(
                        imageErrorBuilder: (_, __, ___) {
                          return Image.memory(kTransparentImage);
                        },

                        placeholder: kTransparentImage,
                        image: widget.posterURL,
                        imageScale: 2,
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
