// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewMember _$CrewMemberFromJson(Map<String, dynamic> json) => CrewMember(
      id: json['id'] as int,
      name: json['name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      jobTitle: json['job_title'] as String,
      photoUrl: json['photo'] as String,
    );

Map<String, dynamic> _$CrewMemberToJson(CrewMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'popularity': instance.popularity,
      'job_title': instance.jobTitle,
      'photo': instance.photoUrl,
    };
