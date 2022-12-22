import 'package:json_annotation/json_annotation.dart';

part 'crew_member.g.dart';

@JsonSerializable()
class CrewMember {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "popularity")
  final double popularity;

  @JsonKey(name: "job_title")
  final String jobTitle;

  CrewMember(
      {required this.id,
      required this.name,
      required this.popularity,
      required this.jobTitle});

  factory CrewMember.fromJson(Map<String, dynamic> data) =>
      _$CrewMemberFromJson(data);
}
