// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closetdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClosetPostRequestDto _$ClosetPostRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ClosetPostRequestDto(
      large: json['large'] as String,
      medium: json['medium'] as String,
      small: json['small'] as String,
      fit: json['fit'] as String,
      gender: json['gender'] as String,
      style: json['style'] as String,
      thickness: json['thickness'] as String,
    );

Map<String, dynamic> _$ClosetPostRequestDtoToJson(
        ClosetPostRequestDto instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'fit': instance.fit,
      'gender': instance.gender,
      'style': instance.style,
      'thickness': instance.thickness,
    };

ClosetPostDTO _$ClosetPostDTOFromJson(Map<String, dynamic> json) =>
    ClosetPostDTO(
      closetPostRequestDto: ClosetPostRequestDto.fromJson(
          json['closetPostRequestDto'] as Map<String, dynamic>),
      clothImg: json['clothImg'] as String,
    );

Map<String, dynamic> _$ClosetPostDTOToJson(ClosetPostDTO instance) =>
    <String, dynamic>{
      'closetPostRequestDto': instance.closetPostRequestDto,
      'clothImg': instance.clothImg,
    };

CategorizationRequestDTO _$CategorizationRequestDTOFromJson(
        Map<String, dynamic> json) =>
    CategorizationRequestDTO(
      clothImg: json['clothImg'] as String,
    );

Map<String, dynamic> _$CategorizationRequestDTOToJson(
        CategorizationRequestDTO instance) =>
    <String, dynamic>{
      'clothImg': instance.clothImg,
    };
