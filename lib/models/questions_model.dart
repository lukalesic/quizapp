import 'package:json_annotation/json_annotation.dart';
import 'package:quizapp/models/answer.dart';

@JsonSerializable()
class CrewMember {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "popularity")
  final int popularity;

  @JsonKey(name: "job_title")
  final String jobTitle;

  @JsonKey(name: "photo")
  final String photoUrl;

  @JsonKey(name: "movies")
  final List<Movie> movies;

  CrewMember({
    required this.id,
    required this.name,
    required this.popularity,
    required this.jobTitle,
    required this.photoUrl,
    required this.movies,
  });

  String getQuestion() {
    return "Pick movie where $name was $jobTitle";
  }
}
