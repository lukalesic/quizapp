import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/question.dart';
import '../models/questions.dart';

Future<Question?> fetchSingleQuestion() async {
  final response = await http.get(
      Uri.parse('https://mdfjfuhfct.eu-west-1.awsapprunner.com/question/'));

  if (response.statusCode == 200) {
    Question question =
        Question.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    question.movies.shuffle();

    return question;
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
