import 'package:json_annotation/json_annotation.dart';

part 'profiledto.g.dart';

@JsonSerializable()
class ProfileDTO {
  final String nickname;

  ProfileDTO({required this.nickname});

  factory ProfileDTO.fromJson(Map<String, dynamic> json) => _$ProfileDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDTOToJson(this);
}
