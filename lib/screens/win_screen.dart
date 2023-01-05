import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizapp/screens/lose_screen.dart';
import 'package:quizapp/screens/standard_quiz_screen.dart';
import 'package:quizapp/screens/survival_quiz_screen.dart';
import 'package:quizapp/screens/time_attack_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../remote/repository.dart';
import '../style/appstyle.dart';
import '../models/highscore.dart';
import 'homescreen.dart';

class WinScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int resultScore;
  final List highScores;
  final String gameMode;

  const WinScreen(
      {required this.correctAnswers,
      required this.totalQuestions,
      required this.gameMode,
      required this.resultScore,
      required this.highScores,
      super.key});

  @override
  State<WinScreen> createState() => _WinScreenState(
      correctAnswers, totalQuestions, gameMode, resultScore, highScores);
}

class _WinScreenState extends State<WinScreen> {
  int correctAnswers;
  int totalQuestions;
  int resultScore;
  List highScores;
  String gameMode;

  getScores(String gameMode) async {
    var prefs = await SharedPreferences.getInstance();
    String? source = prefs.getString(gameMode);
    var maps = source != null ? jsonDecode(source) : [];
    setState(() {
      highScores = maps.map((e) => HighScore.fromMap(e)).toList();
    });
  }

  _WinScreenState(this.correctAnswers, this.totalQuestions, this.gameMode,
      this.resultScore, this.highScores);

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
                  Spacer(),
                  Text("Game completed!", style: AppStyle.largeTitle),
                  Spacer(),
                  Text(
                    "Result: ${correctAnswers}/${totalQuestions}",
                    style: AppStyle.mainTitle,
                  ),
                  if (gameMode != 'standard')
                    Column(children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Score: $resultScore",
                        style: AppStyle.mainTitle,
                      ),
                    ]),
                  SizedBox(
                    height: 8,
                  ),
                  for (var highScore in highScores)
                    Text(
                      "High score: ${highScore.score.toString()}",
                      style: AppStyle.mainTitle,
                    ),
                  Spacer(),
                  SizedBox(height: 16),
                  Center(
                    child: FloatingActionButton.extended(
                      label: Text(
                        'Play again',
                        style: AppStyle.floatingButtonStyle,
                      ), // <-- Text
                      backgroundColor: AppStyle.accentColor,
                      icon: Icon(
                        // <-- Icon
                        Icons.play_arrow_rounded,
                        size: 24.0,
                      ),
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

                          case SurvivalQuizScreen.survivalGameMode:
                            await fetchQuestions().then((result) => {
                                  if (result != null)
                                    {
                                      Navigator.of(context).pop(),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  SurvivalQuizScreen(
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
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Center(
                    child: FloatingActionButton.extended(
                      label: Text(
                        'Main Menu',
                        style: AppStyle.floatingButtonStyle,
                      ), // <-- Text
                      backgroundColor: AppStyle.accentColor,
                      icon: Icon(
                        Icons.home,
                        size: 24.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomeScreen())));
                      },
                    ),
                  ),
                  Spacer(),
                ])));
  }
}
