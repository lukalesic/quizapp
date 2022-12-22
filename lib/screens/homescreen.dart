import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizapp/screens/quizscreen.dart';
import '../models/questions.dart';
import '../style/appstyle.dart';
import 'package:http/http.dart' as http;

Future<Questions?> fetchQuestions() async {
  final response = await http
      .get(Uri.parse('https://mdfjfuhfct.eu-west-1.awsapprunner.com/quiz/'));

  if (response.statusCode == 200) {
    Questions questions =
        Questions.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    for (var question in questions.questions) {
      question.movies.shuffle();
    }

    return questions;
  } else {
    return null;
  }
}

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
                                    builder: ((context) => QuizScreen(
                                        questions: result.questions))))
                          }
                      });
                },
                child: Icon(Icons.play_arrow_rounded, color: Colors.white),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.blue // <-- Button color
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
