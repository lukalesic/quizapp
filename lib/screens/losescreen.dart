import 'package:flutter/material.dart';

import '../style/appstyle.dart';

class LoseScreen extends StatefulWidget {
  final int resultScore;
  final int totalQuestions;

  const LoseScreen({
    required this.resultScore,
    required this.totalQuestions,
    super.key,
  });

  @override
  State<LoseScreen> createState() =>
      __LoseScreenStateState(resultScore, totalQuestions);
}

class __LoseScreenStateState extends State<LoseScreen> {
  int resultScore;
  int totalQuestions;

  __LoseScreenStateState(this.resultScore, this.totalQuestions);

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
                  Text("Timer expired!", style: AppStyle.mainTitle),
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
