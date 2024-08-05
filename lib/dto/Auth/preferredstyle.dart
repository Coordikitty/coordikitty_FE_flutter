import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../ui/Auth/login.dart';

class PreferredStyleDTO {
  final String email;
  final String password;
  final String nickname;
  final String name;
  final int year;
  final int month;
  final int day;
  final String phoneNumber;
  final int tall;
  final int weight;
  final int footSize;

  PreferredStyleDTO({
    required this.email,
    required this.password,
    required this.nickname,
    required this.name,
    required this.year,
    required this.month,
    required this.day,
    required this.phoneNumber,
    required this.tall,
    required this.weight,
    required this.footSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'nickname': nickname,
      'name': name,
      'year': year,
      'month': month,
      'day': day,
      'phoneNumber': phoneNumber,
      'tall': tall,
      'weight': weight,
      'footSize': footSize,
    };
  }

  Future<void> confirmSelection(BuildContext context, List<String> selectedImages) async {
    if (selectedImages.length != 3) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('선호하는 스타일의 사진을 3개 선택하여 주세요'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      try {
        final response = await http.post(
          Uri.parse('http://ec2-3-36-29-29.ap-northeast-2.compute.amazonaws.com:8080/auth/signUp'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(toJson()..['selectedImages'] = selectedImages),
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
            throw Exception('Unexpected response: ${responseBody}');
          }
        } else if (response.statusCode == 400) {
          final responseBody = jsonDecode(response.body);
          throw Exception('Error: ${responseBody['message']}');
        } else {
          throw Exception('Failed to sign up: ${response.statusCode}');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('회원가입 실패: $e')),
        );
      }
    }
  }
}