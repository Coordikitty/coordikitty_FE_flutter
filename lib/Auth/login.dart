import 'package:coordikitty_fe_flutter/Auth/signup.dart';
import 'package:coordikitty_fe_flutter/Auth/sociallogin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Home/follow.dart';
import '../dto/logindto.dart';
import '../dto/restclient.dart';
import 'find_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: Color(0xffD1D1D1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15,),
                LoginTextForm(
                  controller: email,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 6,),
                LoginTextForm(
                  controller: password,
                  text: 'password',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 15,),
                Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text(
                      '이메일/비밀번호를 잊으셨나요?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FindAuth()));
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginButton(
                        text: '회원가입',
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUp()))
                    ),
                    SizedBox(width: 50,),
                    LoginButton(
                      text: '로그인',
                      onPressed: () => _login(context),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                SocialLogin(),
                Align(
                  child: Text(
                    "이용약관 | 개인정보처리방침 | 청소년보호정책",
                    style: TextStyle(
                      fontSize: screenWidth * (14 / 360),
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    String userEmail = email.text;
    String userPassword = password.text;

    if (userEmail.isEmpty || userPassword.isEmpty) {
      showSnackBar(context, '이메일과 비밀번호를 입력하세요.');
      return;
    }

    try {
      final dio = Dio();
      final restClient = RestClient(dio);

      final loginDTO = LoginDTO(email: userEmail, password: userPassword);

      print('LoginDTO: ${loginDTO.toJson()}');

      final loginResponse = await restClient.loginRequest(loginDTO);

      print('LoginResponse: ${loginResponse?.toJson()}');

      if (loginResponse == null) {
        throw Exception('Login response is null');
      }

      final tokenResponse = loginResponse.tokenDto; // Assuming the tokenDto is part of loginResponse

      if (tokenResponse == null || tokenResponse.refreshToken == null) {
        throw Exception('Token response or token is null');
      }

      // 로그인 성공
      String token = tokenResponse.refreshToken ?? '';

      dio.options.headers['Authorization'] = 'Bearer $token';

      // 로그인 성공 후 페이지 이동
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Follow()));
      }

    } catch (e) {
      print('Error: $e');
      showSnackBar(context, '로그인 정보가 올바르지 않습니다.');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const LoginButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class LoginTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool obscure;
  final TextInputType textInputType;

  const LoginTextForm({
    Key? key,
    required this.controller,
    required this.text,
    required this.obscure,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
      ),
    );
  }
}
