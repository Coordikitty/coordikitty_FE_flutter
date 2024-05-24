import 'package:flutter/material.dart';

import '../follow.dart';
import '../login.dart';
import '../signup.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(text == '회원가입')
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
        else if(text == '로그인')
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Follow()));
      },
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

void showSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text('로그인 정보를 다시 확인하세요',  // 아이디(이메일) 불일치 || 비밀번호 불일치
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      )
  );
}