import 'package:coordikitty_fe_flutter/ui/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:coordikitty_fe_flutter/widget/Auth/loginform.dart';
import 'package:coordikitty_fe_flutter/dto/Auth/login.dart';

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

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    LoginDTO loginDTO = LoginDTO(emailController: emailController, passwordController: passwordController);

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
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 6,),
                LoginTextForm(
                  controller: passwordController,
                  text: 'Password',
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
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FindAuth()));
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginButton(
                      text: '회원가입',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                      },
                    ),
                    SizedBox(width: 50,),
                    LoginButton(
                      text: '로그인',
                      onPressed: () {
                        loginDTO.authenticateWithToken(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 50,),
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
}
