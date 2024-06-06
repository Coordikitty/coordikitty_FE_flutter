import 'dart:convert';

import 'package:coordikitty_fe_flutter/dto/postdto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'closetdto.dart';
import 'signupdto.dart';
import 'logindto.dart';

part 'restclient.g.dart';

@RestApi(baseUrl: 'http://ec2-13-125-54-118.ap-northeast-2.compute.amazonaws.com:8080')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /* 로그인 */
  @POST('/auth/token')
  Future<TokenDto> getToken(@Body() Map<String, dynamic> body);

  @POST('/auth/login')
  Future<LoginResponse> loginRequest(@Body() LoginDTO loginDTO);

  /* 회원가입 */
  @GET('/auth/signUp/dupCheck')
  Future<bool> DupcheckRequest(@Queries() Map<String, dynamic> queryParams);

  @POST('/auth/signUp')
  Future<SignupResponse> signupRequest(@Body() SignupDTO signupDTO);

  /* 옷장 */
  @GET('/closet')
  Future<void> getCloset();

  @POST('/closet')
  Future<String> closetPost(@Body() ClosetPostDTO closetPostDto, MultipartFile multipartFile);

  @DELETE('/closet')
  Future<void> deleteCloth(@Query('clothId') String clothId);

  @POST('/closet/categorization')
  Future<void> categorizeCloth(@Body() CategorizationRequestDTO requestDto);

  /* 게시물 */
  @PUT('/post/{postId}')
  Future<void> updatePost(@Path("postId") String postId, @Body() PostUpdateDTO postupdateDTO);

  @POST('/post/upload')
  Future<PostResponse> uploadPost(@Body() PostUploadDTO postuploadDTO);

  @GET('/post/get/{postId}')
  Future<PostDetailsResponse> getPost(@Path("postId") String postId);

  @DELETE('/post/delete')
  Future<String> postDelete(@Queries() Map<String, dynamic> queryParams);

/*
  @GET('/post/unLogged')

  @GET('/post/logged')
*/


/*
  /* 로그아웃 */
  @POST('/auth/withdraw')

  /* 프로필 */
  @GET('/setting/profile')

  @POST('/setting/profile')
  Future<ProfileResponse> profileRequest(@Body() ProfileDTO profileDTO);

  /* 이미지 */
  @GET('/setting/image')
  @POST('/setting/image')

  /* 알람 */
  @GET('/setting/alarm')
  @POST('/setting/alarm')

  /* 피드 */
  @POST('/post/like')
  @DELETE('/post/like')

  /* 북마크 */
  @POST('/post/bookmark')
  @DELETE('/post/bookmark')

  /* 알람 */
  @POST('/hi')
  @GET('/')
   */



}