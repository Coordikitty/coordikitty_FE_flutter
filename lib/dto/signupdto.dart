import 'package:json_annotation/json_annotation.dart';

part 'signupdto.g.dart';

@JsonSerializable()
class SignupDTO {
  final String email;
  final String password;
  final String nickname;
  final String name;
  final int year;
  final int month;
  final int day;
  final String phoneNumber;
  final int tall;
  final int weight;
  final int footSize;
  //final List<String> preferredStyle;

  SignupDTO({
    required this.email,
    required this.password,
    required this.nickname,
    required this.name,
    required this.year,
    required this.month,
    required this.day,
    required this.phoneNumber,
    required this.tall,
    required this.weight,
    required this.footSize,
    //required this.preferredStyle,
  });

  factory SignupDTO.fromJson(Map<String, dynamic> json) => _$SignupDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SignupDTOToJson(this);
}

@JsonSerializable()
class DupCheckDTO {
  final String email;
  final String nickname;

  DupCheckDTO({required this.email, required this.nickname});

  factory DupCheckDTO.fromJson(Map<String, dynamic> json) => _$DupCheckDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DupCheckDTOToJson(this);
}


class DupcheckResponse {
  final bool isAvailable;

  DupcheckResponse({required this.isAvailable});

  factory DupcheckResponse.fromResponse(bool response) =>
      DupcheckResponse(isAvailable: response);
}

@JsonSerializable()
class SignupResponse {
  final String message;

  SignupResponse({required this.message});

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}