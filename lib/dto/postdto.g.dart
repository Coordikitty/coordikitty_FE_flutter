// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUpdateDTO _$PostUpdateDTOFromJson(Map<String, dynamic> json) =>
    PostUpdateDTO(
      content: json['content'] as String,
      situation: json['situation'] as String,
      style: json['style'] as String,
      postImgs:
          (json['postImgs'] as List<dynamic>).map((e) => e as String).toList(),
      clothIds:
          (json['clothIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostUpdateDTOToJson(PostUpdateDTO instance) =>
    <String, dynamic>{
      'content': instance.content,
      'situation': instance.situation,
      'style': instance.style,
      'postImgs': instance.postImgs,
      'clothIds': instance.clothIds,
    };

PostUploadDTO _$PostUploadDTOFromJson(Map<String, dynamic> json) =>
    PostUploadDTO(
      postUploadRequestDto: PostUploadRequestDTO.fromJson(
          json['postUploadRequestDto'] as Map<String, dynamic>),
      postImgs:
          (json['postImgs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostUploadDTOToJson(PostUploadDTO instance) =>
    <String, dynamic>{
      'postUploadRequestDto': instance.postUploadRequestDto,
      'postImgs': instance.postImgs,
    };

PostUploadRequestDTO _$PostUploadRequestDTOFromJson(
        Map<String, dynamic> json) =>
    PostUploadRequestDTO(
      content: json['content'] as String,
      style: json['style'] as String,
      clothIds:
          (json['clothIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostUploadRequestDTOToJson(
        PostUploadRequestDTO instance) =>
    <String, dynamic>{
      'content': instance.content,
      'style': instance.style,
      'clothIds': instance.clothIds,
    };

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      id: json['id'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };

PostDetailsResponse _$PostDetailsResponseFromJson(Map<String, dynamic> json) =>
    PostDetailsResponse(
      postId: json['postId'] as String,
      content: json['content'] as String,
      style: json['style'] as String,
      postLike: (json['postLike'] as num).toInt(),
      postImgs:
          (json['postImgs'] as List<dynamic>).map((e) => e as String).toList(),
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      uploaderEmail: json['uploaderEmail'] as String,
      uploaderNickname: json['uploaderNickname'] as String,
      uploaderProfileImg: json['uploaderProfileImg'] as String,
      isLiked: json['isLiked'] as bool,
      isBookmarked: json['isBookmarked'] as bool,
    );

Map<String, dynamic> _$PostDetailsResponseToJson(
        PostDetailsResponse instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'content': instance.content,
      'style': instance.style,
      'postLike': instance.postLike,
      'postImgs': instance.postImgs,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'uploaderEmail': instance.uploaderEmail,
      'uploaderNickname': instance.uploaderNickname,
      'uploaderProfileImg': instance.uploaderProfileImg,
      'isLiked': instance.isLiked,
      'isBookmarked': instance.isBookmarked,
    };
