import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "original_title")
  final String title;

  @JsonKey(name: "imdb_rating")
  final String? imdbRating;

  @JsonKey(name: "is_answer")
  final bool isAnswer;

  @JsonKey(name: "photo")
  final String posterUrl;

  Movie(
      {required this.id,
      required this.title,
      required this.imdbRating,
      required this.isAnswer,
      required this.posterUrl});

  factory Movie.fromJson(Map<String, dynamic> data) => _$MovieFromJson(data);
}
