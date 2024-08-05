import 'package:coordikitty_fe_flutter/ui/Home/recommend.dart';
import 'package:coordikitty_fe_flutter/ui/Home/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widget/snackbar.dart';

class LoginDTO {
  TextEditingController emailController;
  TextEditingController passwordController;

  LoginDTO({required this.emailController, required this.passwordController});

  /* jwt 토큰 요청 및 인증*/
  Future<void> authenticateWithToken(BuildContext context) async {
    const url = 'http://ec2-3-36-29-29.ap-northeast-2.compute.amazonaws.com:8080/auth/login';

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBar(context, '이메일과 비밀번호를 입력하세요.');
      return;
    }

    // JSON 형식으로 인코딩하여 HTTP POST 요청 보내기
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      // 응답 처리
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('Server response: $jsonResponse');

        var tokenDto = jsonResponse['tokenDto'];
        String? accessToken = tokenDto?['accessToken'];
        String? refreshToken = tokenDto?['refreshToken'];

        // 토큰이 없을 경우
        if (accessToken == null || refreshToken == null) {
          throw Exception('토큰이 없습니다.');
        }

        if (accessToken.isEmpty || refreshToken.isEmpty) {
          throw Exception('토큰 값이 일치하지 않습니다.');
        }

        // 토큰 저장 후 follow 화면으로 이동
        await _saveTokens(accessToken, refreshToken);
        print('액세스 토큰: $accessToken');
        print('리프레시 토큰: $refreshToken');
        showSnackBar(context, '로그인 성공!');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Tabbar()),
        );
      } else {
        showSnackBar(context, '로그인 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      showSnackBar(context, '로그인 정보가 올바르지 않습니다.');
    }
  }

  /* 토큰 저장 함수 */
  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }
}
