import 'package:flutter/material.dart';

class verifyButton extends StatelessWidget {

  const verifyButton({super.key, required this.text});

  final String text;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*
        if()  // 닉네임중복
          showSnackBar_nickname(context);
        else if() //이메일 중복
          showSnackBar_email(context);
        else
          showSnackBar_success(context);

         */


      },
      child: Container(
        height: 25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 7
              )
            ]
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}

void showSnackBar_nickname(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text('중복되는 닉네임이 있습니다',  // 중복되는 닉네임, 이메일이 있을 경우
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      )
  );
}

void showSnackBar_email(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text('인증 번호를 전송하였습니다.',  // 인증번호 받기 눌렀을 경우
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      )
  );
}

void showSnackBar_success(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text('인증되었습니다.',  // 인증 완료 되었을 경우
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      )
  );
}
