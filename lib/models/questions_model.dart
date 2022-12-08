import 'package:quizapp/widgets/answer_option.dart';

class Question {

  final String id;
  final String title;
  final List<AnswerOption> answers;
  //final Map<AnswerOption, bool> answers;

  Question({
    required this.id,
    required this.title,
    required this.answers,
  });
  
}