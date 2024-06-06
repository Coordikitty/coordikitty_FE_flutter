import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';


part 'closetdto.g.dart';
@JsonSerializable()
class ClosetPostRequestDto {
  final String large;
  final String medium;
  final String small;
  final String fit;
  final String gender;
  final String style;
  final String thickness;

  ClosetPostRequestDto({
    required this.large,
    required this.medium,
    required this.small,
    required this.fit,
    required this.gender,
    required this.style,
    required this.thickness,
  });

  factory ClosetPostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ClosetPostRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ClosetPostRequestDtoToJson(this);
}

@JsonSerializable()
class ClosetPostDTO {
  final ClosetPostRequestDto closetPostRequestDto;
  final String clothImg;

  ClosetPostDTO({
    required this.closetPostRequestDto,
    required this.clothImg,
  });

  factory ClosetPostDTO.fromJson(Map<String, dynamic> json) =>
      _$ClosetPostDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ClosetPostDTOToJson(this);
}

@JsonSerializable()
class CategorizationRequestDTO {
  final String clothImg;

  CategorizationRequestDTO({
    required this.clothImg,
  });

  factory CategorizationRequestDTO.fromJson(Map<String, dynamic> json) => _$CategorizationRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategorizationRequestDTOToJson(this);
}


enum Large { OUTER, TOPS, BOTTOMS, SKIRTS, ONEPIECE, SHOES }

enum Medium {
  HOODED_ZIP_UP,
  BLOUSON,
  BLAZER,
  CARDIGAN,
  COAT,
  WIND_BREAKER,
  PADDING,
  TOPS_LONG,
  TOPS_SHORT,
  LESS,
  BOTTOMS_LONG,
  BOTTOMS_SHORT,
  SKIRTS_LONG,
  MIDI,
  MINI
}

enum Small {
  HOODED_ZIP_UP,
  BLOUSON,
  CARDIGAN,
  BLAZER,
  SINGLE,
  TRENCH,
  WIND_BREAKER,
  LONG,
  SHORT,
  TOPS_LONG_NEAT,
  TOPS_LONG_HOODED,
  TOPS_LONG_SWEAT,
  TOPS_LONG_SHIRTS,
  TOPS_LONG_T_SHIRTS,
  TOPS_LONG_SPORTS,
  TOPS_SHORT_POLO,
  TOPS_SHORT_SHIRTS,
  TOPS_SHORT_SWEAT,
  TOPS_SHORT_T_SHIRTS,
  TOPS_SHORT_SPORTS,
  LESS,
  BOTTOMS_LONG_DENIM,
  BOTTOMS_LONG_SLACKS,
  BOTTOMS_LONG_SWEAT,
  BOTTOMS_LONG_CARGO,
  BOTTOMS_LONG_LEGGINGS,
  BOTTOMS_LONG_COTTON,
  BOTTOMS_LONG_SPORTS,
  BOTTOMS_SHORT_DENIM,
  BOTTOMS_SHORT_SWEAT,
  BOTTOMS_SHORT_COTTON,
  BOTTOMS_SHORT_SPORTS,
  SKIRTS_LONG_LAB,
  SKIRTS_LONG_FLARE,
  SKIRTS_LONG_MERMAID,
  MIDI_H,
  MIDI_A,
  MIDI_PLEATS,
  MIDI_FLARE,
  MIDI_K,
  MINI_H,
  MINI_A,
  MINI_LAB,
  MINI_FLARE
}

enum Fit { SKINNY, SLIM, REGULAR, LOOSE, OVER }

enum Gender { MALE, FEMALE, UNISEX }

enum Style { FORMAL, MINIMALISTIC, CASUAL, STREET, SPORTS }

enum Thickness { THN, S_THIN, NORMAL, S_THICK, THICK }