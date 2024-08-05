// 회원가입, 중복확인
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../ui/Auth/login.dart';
import '../../widget/snackbar.dart';

class SignUpDTO {
  final TextEditingController nickname;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController passwordMatch;
  final TextEditingController name;
  final TextEditingController year;
  final TextEditingController month;
  final TextEditingController day;
  final TextEditingController phoneNumber;
  final TextEditingController tall;
  final TextEditingController weight;
  final TextEditingController footSize;

  bool isNicknameChecked = false;
  bool isEmailChecked = false;

  SignUpDTO(
      {required this.nickname, required this.email, required this.password, required this.passwordMatch, required this.name, required this.year, required this.month, required this.day, required this.phoneNumber, required this.tall, required this.weight, required this.footSize});

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname.text,
      'email': email.text,
      'password': password.text,
      'name': name.text,
      'year': int.parse(year.text),
      'month': int.parse(month.text),
      'day': int.parse(day.text),
      'phoneNumber': phoneNumber.text,
      'tall': int.parse(tall.text),
      'weight': int.parse(weight.text),
      'footSize': int.parse(footSize.text),
    };
  }

  Future<void> authenticateWithToken(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accTk = prefs.getString('token');


      if (nickname.text.isEmpty || email.text.isEmpty ||
          password.text.isEmpty ||
          passwordMatch.text.isEmpty || name.text.isEmpty ||
          year.text.isEmpty ||
          month.text.isEmpty || day.text.isEmpty || phoneNumber.text.isEmpty) {
        showSnackBar(context, '모든 필드를 채워주세요.');
        return;
      }

      if (!isNicknameChecked || !isEmailChecked) {
        showSnackBar(context, '닉네임과 이메일 중복확인을 해주세요.');
        return;
      }

      if (password.text != passwordMatch.text) {
        showSnackBar(context, '비밀번호가 일치하지 않습니다.');
        return;
      }

      final signupData = toJson();

      try {
        final response = await http.post(
          Uri.parse(
              'http://ec2-3-36-29-29.ap-northeast-2.compute.amazonaws.com:8080/user/signUp'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(signupData),
        );

        request.headers['Authorization'] = 'Bearer $accTk';
        request.headers['Accept'] = 'application/json';


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
    }
  }
}
