import 'package:flutter/material.dart';

class LoginDTO {
  TextEditingController emailController;
  TextEditingController passwordController;

  LoginDTO({required this.emailController, required this.passwordController});

  Map<String, dynamic> toJson() {
    return {
      "email": emailController.text,
      "password": passwordController.text,
    };
  }

  bool validateFields(BuildContext context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이메일과 비밀번호를 입력하세요.')),
      );
      return false;
    }
    return true;
  }
}

