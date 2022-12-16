import 'package:json_annotation/json_annotation.dart';
import 'package:quizapp/models/question.dart';

part 'questions.g.dart';

@JsonSerializable()
class Questions {
  @JsonKey(name: "questions")
  final List<Question> questions;

  Questions({required this.questions});

  factory Questions.fromJson(Map<String, dynamic> data) =>
      _$QuestionsFromJson(data);
}
