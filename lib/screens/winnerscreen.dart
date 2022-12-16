import 'package:flutter/material.dart';

import '../style/appstyle.dart';

class WinnerScreen extends StatefulWidget {
  final int resultScore;
  final int totalQuestions;

  const WinnerScreen(
      {required this.resultScore, required this.totalQuestions, super.key});

  @override
  State<WinnerScreen> createState() =>
      _WinnerScreenState(resultScore, totalQuestions);
}

class _WinnerScreenState extends State<WinnerScreen> {
  int resultScore;
  int totalQuestions;

  _WinnerScreenState(this.resultScore, this.totalQuestions);

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
                  Center(
                      child: ElevatedButton(
                    onPressed: () {},
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
