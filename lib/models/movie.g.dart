// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      title: json['original_title'] as String,
      imdbRating: json['imdb_rating'] as String?,
      isAnswer: json['is_answer'] as bool,
      posterUrl: json['photo'] as String,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'original_title': instance.title,
      'imdb_rating': instance.imdbRating,
      'is_answer': instance.isAnswer,
      'photo': instance.posterUrl,
    };
