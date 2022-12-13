import 'package:flutter/material.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/screens/homescreen.dart';
import 'package:quizapp/screens/quizscreen.dart';

import '../style/appstyle.dart';

class WinnerScreen extends StatefulWidget {
  final int resultScore;
  const WinnerScreen({required this.resultScore, super.key});

  @override
  State<WinnerScreen> createState() => _WinnerScreenState(resultScore);
}

class _WinnerScreenState extends State<WinnerScreen> {
  int resultScore;
  _WinnerScreenState(this.resultScore);


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
            Text("Result: ${resultScore}/${questions.length}", style: AppStyle.mainTitle,),
                        Text("Tap to play again!", style: AppStyle.mainTitle,),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => QuizScreen())));
                },
                child: Icon(Icons.play_arrow_rounded, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.blue, // <-- Button color
                  foregroundColor: Colors.red, // <-- Splash color
                ),
              )
            )
        ])
         )

    );
  }
}