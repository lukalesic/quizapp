import 'package:flutter/material.dart';
import 'package:quizapp/screens/quizscreen.dart';

import '../style/appstyle.dart';

class LoseScreen extends StatefulWidget {
    final int resultScore;
  const LoseScreen({required this.resultScore, super.key});

  @override
  State<LoseScreen> createState() => __LoseScreenStateState(resultScore);
}

class __LoseScreenStateState extends State<LoseScreen> {

    int resultScore;
    __LoseScreenStateState(this.resultScore);

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
            Text("Result: ${resultScore}/10", style: AppStyle.mainTitle,),
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