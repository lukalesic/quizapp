import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizapp/screens/standard_quiz_screen.dart';
import 'package:quizapp/screens/time_attack_screen.dart';
import 'package:quizapp/screens/win_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style/appstyle.dart';
import '../widgets/highscore.dart';
import 'homescreen.dart';

class LoseScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int resultScore;
  final List highScore;
  final String gameMode;

  const LoseScreen({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.resultScore,
    required this.gameMode,
    required this.highScore,
    super.key,
  });

  @override
  State<LoseScreen> createState() => __LoseScreenStateState(
      correctAnswers, totalQuestions, gameMode, resultScore, highScore);
}

class __LoseScreenStateState extends State<LoseScreen> {
  int correctAnswers;
  int totalQuestions;
  int resultScore;
  String gameMode;
  List highScore;

  __LoseScreenStateState(this.correctAnswers, this.totalQuestions,
      this.gameMode, this.resultScore, this.highScore);

  getScores(String gameMode) async {
    var prefs = await SharedPreferences.getInstance();
    String? source = prefs.getString(gameMode);
    var maps = source != null ? jsonDecode(source) : [];
    setState(() {
      highScore = maps.map((e) => HighScore.fromMap(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    getScores(gameMode);
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
                    "Result: ${correctAnswers}/${totalQuestions}",
                    style: AppStyle.mainTitle,
                  ),
                  if (gameMode != 'standard')
                    Text(
                      "Score: $resultScore",
                      style: AppStyle.mainTitle,
                    ),
                      for (var highScore in highScore)
                    Text(
                      "Current high score: ${highScore.score.toString()}",
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

                      switch (gameMode) {
                        case StandardQuizScreen.standardGameMode:
                          await fetchQuestions().then((result) => {
                                if (result != null)
                                  {
                                    Navigator.of(context).pop(),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                StandardQuizScreen(
                                                    questions:
                                                        result.questions))))
                                  }
                              });
                          break;

                        case TimeAttackScreen.timeAttackGameMode:
                          await fetchQuestions().then((result) => {
                                if (result != null)
                                  {
                                    Navigator.of(context).pop(),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                TimeAttackScreen(
                                                    questions:
                                                        result.questions))))
                                  }
                              });
                          break;
                        default:
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HomeScreen())));
                      }
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
