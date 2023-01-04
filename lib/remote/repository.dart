import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/questions.dart';
import '../models/highscore.dart';

Future<Questions?> fetchSingleQuestion() async {
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

Future<List<HighScore>> getScores(String gameMode) async {
  var prefs = await SharedPreferences.getInstance();
  String? source = prefs.getString(gameMode);
  var maps = source != null ? jsonDecode(source) : [];

  return maps.map((e) => HighScore.fromMap(e)).toList();
}
