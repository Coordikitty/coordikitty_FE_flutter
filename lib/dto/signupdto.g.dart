// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupDTO _$SignupDTOFromJson(Map<String, dynamic> json) => SignupDTO(
      email: json['email'] as String,
      password: json['password'] as String,
      nickname: json['nickname'] as String,
      name: json['name'] as String,
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      day: (json['day'] as num).toInt(),
      phoneNumber: json['phoneNumber'] as String,
      tall: (json['tall'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      footSize: (json['footSize'] as num).toInt(),
    );

Map<String, dynamic> _$SignupDTOToJson(SignupDTO instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'nickname': instance.nickname,
      'name': instance.name,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'phoneNumber': instance.phoneNumber,
      'tall': instance.tall,
      'weight': instance.weight,
      'footSize': instance.footSize,
    };

DupCheckDTO _$DupCheckDTOFromJson(Map<String, dynamic> json) => DupCheckDTO(
      email: json['email'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$DupCheckDTOToJson(DupCheckDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
    };

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      message: json['message'] as String,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
