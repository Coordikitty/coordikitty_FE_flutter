import 'dart:convert';
import 'package:coordikitty_fe_flutter/dto/Auth/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../ui/Home/tabbar.dart';
import '../../widget/snackbar.dart';

class LoginService {
  final url = 'http://ec2-3-36-29-29.ap-northeast-2.compute.amazonaws.com:8080/auth/login';

  /* jwt 토큰 요청 및 인증*/
  Future<void> authenticateWithToken(BuildContext context, LoginDTO loginDTO) async {

    if (!loginDTO.validateFields(context)) {
      showSnackBar(context, '이메일과 비밀번호를 입력하세요.');
      return;
    }

    // JSON 형식으로 인코딩하여 HTTP POST 요청 보내기
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginDTO.toJson()),
      );

      // 응답 처리
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('Server response: $jsonResponse');

        String? accessToken = jsonResponse['accessToken'];

        // 토큰 저장 후 follow 화면으로 이동
        await _saveTokens(accessToken!);
        print('액세스 토큰: $accessToken');
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

  /* access 토큰 저장 함수 */
  Future<void> _saveTokens(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
  }
}
