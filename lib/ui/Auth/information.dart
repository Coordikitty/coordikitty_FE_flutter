import 'package:flutter/material.dart';
import '../../widget/Auth/informationbutton.dart';
import '../../widget/Auth/informationtextform.dart';

class Information extends StatelessWidget {
  Information({
    Key? key,
    required this.email,
    required this.password,
    required this.passwordMatch,
    required this.nickname,
    required this.name,
    required this.year,
    required this.month,
    required this.day,
    required this.phoneNumber,
  });

  final String email;
  final String password;
  final String passwordMatch;
  final String nickname;
  final String name;
  final int year;
  final int month;
  final int day;
  final String phoneNumber;

  final TextEditingController tall = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController footSize = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Container(
                  child: Text(
                    '기본정보 입력',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  '키를 입력 해주세요',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InformationTextForm(controller: tall, textInputType: TextInputType.text),
                SizedBox(height: 30,),
                Text(
                  '몸무게를 입력 해주세요',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15,),
                InformationTextForm(controller: weight, textInputType: TextInputType.text),
                SizedBox(height: 30,),
                Text(
                  '발 사이즈를 입력 해주세요',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15,),
                InformationTextForm(controller: footSize, textInputType: TextInputType.text),
                SizedBox(height: 30,),
                InformationButton(
                  email: email,
                  password: password,
                  passwordMatch: passwordMatch,
                  nickname: nickname,
                  name: name,
                  year: year,
                  month: month,
                  day: day,
                  phoneNumber: phoneNumber,
                  tall: tall,
                  weight: weight,
                  footSize: footSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
