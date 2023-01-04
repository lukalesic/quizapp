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
            Text("Test your kino knowledge!", style: AppStyle.mainTitle),
            SizedBox(height: 16),
            Center(
                child: ElevatedButton(
                    child: Text('Standard'),
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
                    })),
            SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                child: Text('Time attack'),
                onPressed: () async {
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
                                    builder: ((context) => TimeAttackScreen(
                                        questions: result.questions))))
                          }
                      });
                },
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                child: Text('Survival'),
                onPressed: () async {
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
