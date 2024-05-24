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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(170, 40),
            padding: EdgeInsets.zero, // Padding 제거
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {},
          child: Image(
            width: 170,
            height: 40,
            fit: BoxFit.fill, // 이미지가 버튼을 꽉 채우도록 설정
            image: const AssetImage('image/google_login.png'),
          ),
        ),
        SizedBox(height: 15,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(170, 40),
            padding: EdgeInsets.zero, // Padding 제거
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {},
          child: Image(
            width: 170,
            height: 40,
            fit: BoxFit.fill, // 이미지가 버튼을 꽉 채우도록 설정
            image: const AssetImage('image/kakao_login.png'),
          ),
        ),
        SizedBox(height: 15,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(170, 40),
            padding: EdgeInsets.zero, // Padding 제거
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {},
          child: Image(
            width: 170,
            height: 40,
            fit: BoxFit.fill,
            image: const AssetImage('image/naver_login.png'),
          ),
        ),
      ],
    );
  }
}
