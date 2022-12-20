import 'package:json_annotation/json_annotation.dart';
import 'package:quizapp/models/crew_member.dart';

import 'movie.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  @JsonKey(name: "crew_member")
  final CrewMember crewMember;

  @JsonKey(name: "movies")
  final List<Movie> movies;

  Question(this.crewMember, this.movies);

  String getQuestion() {
    return "Pick the movie where ${crewMember.name} was ${crewMember.jobTitle}";
  }

  factory Question.fromJson(Map<String, dynamic> data) =>
      _$QuestionFromJson(data);
}
