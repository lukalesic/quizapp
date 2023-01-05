import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizapp/screens/standard_quiz_screen.dart';
import 'package:quizapp/screens/survival_quiz_screen.dart';
import 'package:quizapp/screens/time_attack_screen.dart';
import '../remote/repository.dart';
import '../style/appstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        title: RichText(
          text: TextSpan(style: AppStyle.mainTitle, children: [
            TextSpan(text: "K", style: AppStyle.logoStyle),
            TextSpan(text: "i", style: AppStyle.logoHighlightStyle),
            TextSpan(text: "nowledge", style: AppStyle.logoStyle)
          ]),
        ),
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: AppStyle.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Text("Test your kino knowledge!",
                  textAlign: TextAlign.center, style: AppStyle.largeTitle),
            ),
            Spacer(),
            SizedBox(height: 16),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FloatingActionButton.extended(
                    label: Text('Standard'), // <-- Text
                    backgroundColor: AppStyle.accentColor,
                    icon: Icon(
                      Icons.gamepad,
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
                  ),
                  SizedBox(height: 12),
                  FloatingActionButton.extended(
                    label: Text('Time attack'), // <-- Text
                    backgroundColor: AppStyle.accentColor,
                    icon: Icon(
                      Icons.access_alarm_rounded,
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

                      await fetchQuestions().then((result) => {
                            if (result != null)
                              {
                                Navigator.of(context).pop(),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => TimeAttackScreen(
                                            questions: result.questions))))
                              }
                          });
                    },
                  ),
                  SizedBox(height: 12),
                  FloatingActionButton.extended(
                    label: Text('Survival'), // <-- Text
                    backgroundColor: Colors.grey,
                    icon: Icon(
                      // <-- Icon
                      Icons.adb_rounded,
                      size: 24.0,
                    ),
                    onPressed: null,
                    /*         () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AbsorbPointer(
                          child: Center(child: CircularProgressIndicator()));
                    },
                  );

                  await fetchQuestions().then((result) => {
                        if (result != null)
                          {
                            Navigator.of(context).pop(),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SurvivalQuizScreen(
                                        questions: result.questions))))
                          }
                      });
                }, */
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
