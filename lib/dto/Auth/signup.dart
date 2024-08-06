// 회원가입, 중복확인
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../ui/Auth/login.dart';
import '../../widget/snackbar.dart';

class SignUpDTO {
  final TextEditingController nickname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordMatch = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController month = TextEditingController();
  final TextEditingController day = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController tall = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController footSize = TextEditingController();
  //final TextEditingController preferredStyle = TextEditingController();

  bool isNicknameChecked = false;
  bool isEmailChecked = false;

  Map<String, dynamic> toJson() {
    return {
      'email': email.text,
      'password': password.text,
      'nickname': nickname.text,
      'name': name.text,
      'year': int.parse(year.text),
      'month': int.parse(month.text),
      'day': int.parse(day.text),
      'phoneNumber': phoneNumber.text,
      'tall': int.parse(tall.text),
      'weight': int.parse(weight.text),
      'footSize': int.parse(footSize.text),
      //'preferredStyle': preferredStyle.text
    };
  }

  bool validateFields(BuildContext context) {
    if (nickname.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        passwordMatch.text.isEmpty ||
        name.text.isEmpty ||
        year.text.isEmpty ||
        month.text.isEmpty ||
        day.text.isEmpty ||
        phoneNumber.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필드를 채워주세요.')),
      );
      return false;
    }

    if (!isNicknameChecked || !isEmailChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('닉네임과 이메일 중복확인을 해주세요.')),
      );
      return false;
    }

    if (password.text != passwordMatch.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호가 일치하지 않습니다.')),
      );
      return false;
    }
    return true;
  }
}

class SignUpService {

  final String url = 'http://ec2-3-36-29-29.ap-northeast-2.compute.amazonaws.com:8080/user/signUp';

  Future<void> authenticateWithToken(BuildContext context,
      SignUpDTO signUpDTO) async {
    if (!signUpDTO.validateFields(context)) {
      return;
    }

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accTk = prefs.getString('token');

      final signupData = signUpDTO.toJson();

      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accTk',
            'Accept': 'application/json',
          },
          body: jsonEncode(signupData),
        );

        if (response.statusCode == 200) {
          final responseBody = jsonDecode(response.body);
          if (responseBody == '회원가입 성공') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('회원가입이 완료되었습니다')),
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            );
          } else {
            throw Exception('Unexpected response: $responseBody');
          }
        } else if (response.statusCode == 400) {
          final responseBody = jsonDecode(response.body);
          throw Exception('Error: ${responseBody['message']}');
        } else {
          throw Exception('회원가입 실패: ${response.statusCode}');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('회원가입 실패: $e')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('회원가입 중 오류 발생: $e')),
      );
    }
  }
}
