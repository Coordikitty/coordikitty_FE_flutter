import 'package:flutter/material.dart';

class duplecheckButton extends StatelessWidget {
  const duplecheckButton({super.key});

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
        width: 100,
        height: 40,
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
          '중복확인',
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
      Text('중복되는 이메일로 가입한 이력이 있습니다',  // 중복되는 이메일이 있을 경우
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      )
  );
}

void showSnackBar_success(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text('사용하실 수 있습니다',  // 중복되는 이메일이 있을 경우
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      )
  );
}
