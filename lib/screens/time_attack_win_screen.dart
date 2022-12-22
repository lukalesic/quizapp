import 'package:flutter/material.dart';
import 'package:quizapp/screens/standard_quiz_screen.dart';

import '../style/appstyle.dart';
import 'homescreen.dart';

class TimeAttackWinScreen extends StatefulWidget {
  final int resultScore;
  final int totalQuestions;

  const TimeAttackWinScreen(
      {required this.resultScore, required this.totalQuestions, super.key});

  @override
  State<TimeAttackWinScreen> createState() =>
      _TimeAttackWinScreenState(resultScore, totalQuestions);
}

class _TimeAttackWinScreenState extends State<TimeAttackWinScreen> {
  int resultScore;
  int totalQuestions;

  _TimeAttackWinScreenState(this.resultScore, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Game completed!", style: AppStyle.mainTitle),
                  Text(
                    "Result: ${resultScore}/${totalQuestions}",
                    style: AppStyle.mainTitle,
                  ),
                  Text(
                    "Tap to play again!",
                    style: AppStyle.mainTitle,
                  ),
                  SizedBox(height: 16),
                  Center(
                      child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AbsorbPointer(
                              child:
                                  Center(child: CircularProgressIndicator()));
                        },
                      );
                      await fetchQuestions().then((result) => {
                            if (result != null)
                              {
                                Navigator.of(context).pop(),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            StandardQuizScreen(
                                                questions: result.questions))))
                              }
                          });
                    },
                    child: Icon(Icons.play_arrow_rounded, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.blue, // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ))
                ])));
  }
}
