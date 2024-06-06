import 'package:json_annotation/json_annotation.dart';

part 'postdto.g.dart';

@JsonSerializable()
class PostUpdateDTO {
  final String content;
  final String situation;
  final String style;
  final List<String> postImgs;
  final List<String> clothIds;

  PostUpdateDTO({
    required this.content,
    required this.situation,
    required this.style,
    required this.postImgs,
    required this.clothIds,
  });

  factory PostUpdateDTO.fromJson(Map<String, dynamic> json) => _$PostUpdateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostUpdateDTOToJson(this);
}

@JsonSerializable()
class PostUploadDTO {

  @JsonKey(name: 'postUploadRequestDto')
  final PostUploadRequestDTO postUploadRequestDto; // Corrected field name
  final List<String> postImgs;

  PostUploadDTO({
    required this.postUploadRequestDto, // Corrected field name
    required this.postImgs,
  });

  factory PostUploadDTO.fromJson(Map<String, dynamic> json) => _$PostUploadDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostUploadDTOToJson(this);
}

@JsonSerializable()
class PostUploadRequestDTO {
  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'style')
  final String style;

  @JsonKey(name: 'clothIds')
  final List<String> clothIds;

  PostUploadRequestDTO({required this.content, required this.style, required this.clothIds});

  factory PostUploadRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$PostUploadRequestDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PostUploadRequestDTOToJson(this);
}

@JsonSerializable()
class PostResponse {
  final String id;
  final String status;

  PostResponse({
    required this.id,
    required this.status,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}

@JsonSerializable()
class PostDetailsResponse {
  final String postId;
  final String content;
  final String style;
  final int postLike;
  final List<String> postImgs;
  final DateTime uploadDate;
  final String uploaderEmail;
  final String uploaderNickname;
  final String uploaderProfileImg;
  final bool isLiked;
  final bool isBookmarked;

  PostDetailsResponse({
    required this.postId,
    required this.content,
    required this.style,
    required this.postLike,
    required this.postImgs,
    required this.uploadDate,
    required this.uploaderEmail,
    required this.uploaderNickname,
    required this.uploaderProfileImg,
    required this.isLiked,
    required this.isBookmarked,
  });

  factory PostDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PostDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostDetailsResponseToJson(this);
}

enum Style { FORMAL, MINIMALISTIC, CASUAL, STREET, SPORTS }