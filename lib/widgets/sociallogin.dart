import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            '또는 SNS로 시작하기',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Image(
          width: 180,
          height: 50,
          image: const AssetImage('image/google_login.png'),
        ),
        SizedBox(height: 15,),
        Image(
          width: 170,
          height: 50,
          image: const AssetImage('image/kakao_login.png'),
        ),
        SizedBox(height: 15,),
        Image(
          width: 180,
          height: 50,
          image: const AssetImage('image/naver_login.png'),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}
