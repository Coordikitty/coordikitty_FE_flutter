import 'package:json_annotation/json_annotation.dart';

part 'logindto.g.dart';

@JsonSerializable()
class LoginDTO {
  final String email;
  final String password;

  LoginDTO({required this.email, required this.password});

  factory LoginDTO.fromJson(Map<String, dynamic> json) => _$LoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}

@JsonSerializable()
class TokenDto {
  final String accessToken;
  final String refreshToken;

  TokenDto({required this.accessToken, required this.refreshToken});

  factory TokenDto.fromJson(Map<String, dynamic> json) => _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final String? email;
  final String? nickname;
  final TokenDto? tokenDto;

  LoginResponse({this.email, this.nickname, this.tokenDto});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
