import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizapp/screens/standard_quiz_screen.dart';
import 'package:quizapp/screens/survival_quiz_screen.dart';
import 'package:quizapp/screens/time_attack_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/highscore.dart';
import '../remote/repository.dart';
import '../style/appstyle.dart';
import 'homescreen.dart';

class LoseScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int resultScore;
  final List highScores;
  final String gameMode;

  const LoseScreen({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.resultScore,
    required this.gameMode,
    required this.highScores,
    super.key,
  });

  @override
  State<LoseScreen> createState() => __LoseScreenStateState(
      correctAnswers, totalQuestions, gameMode, resultScore, highScores);
}

class __LoseScreenStateState extends State<LoseScreen> {
  int correctAnswers;
  int totalQuestions;
  int resultScore;
  String gameMode;
  List highScores;

  __LoseScreenStateState(this.correctAnswers, this.totalQuestions,
      this.gameMode, this.resultScore, this.highScores);

  getScores(String gameMode) async {
    var prefs = await SharedPreferences.getInstance();
    String? source = prefs.getString(gameMode);
    var maps = source != null ? jsonDecode(source) : [];
    setState(() {
      highScores = maps.map((e) => HighScore.fromMap(e)).toList();
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
                  Spacer(),
                  Text("Timer expired!", style: AppStyle.largeTitle),
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
                      "Current high score: ${highScore.score.toString()}",
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
