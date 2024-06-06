import 'package:coordikitty_fe_flutter/Auth/style.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  Information({
    Key? key,
    required this.email,
    required this.password,
    required this.nickname,
    required this.name,
    required this.year,
    required this.month,
    required this.day,
    required this.phoneNumber,
  });

  final String email;
  final String password;
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

class InformationButton extends StatelessWidget {
  const InformationButton({
    Key? key,
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
  }) : super(key: key);

  final String email;
  final String password;
  final String nickname;
  final String name;
  final int year;
  final int month;
  final int day;
  final String phoneNumber;
  final TextEditingController tall;
  final TextEditingController weight;
  final TextEditingController footSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_validateForm(context)) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Style(
                email: email,
                password: password,
                nickname: nickname,
                name: name,
                year: year,
                month: month,
                day: day,
                phoneNumber: phoneNumber,
                tall: int.parse(tall.text),
                weight: int.parse(weight.text),
                footSize: int.parse(footSize.text),
              ),
            ),
          );
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xffAEAEAE),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Text(
          '확인',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  bool _validateForm(BuildContext context) {
    if (tall.text.isEmpty || weight.text.isEmpty || footSize.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill out all fields.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.grey,
        ),
      );
      return false;
    }
    return true;
  }
}


class  InformationTextForm extends StatelessWidget {
  const InformationTextForm ({super.key, required this.controller, required this.textInputType});

  final TextEditingController controller;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          //hintText: text,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          /*hintStyle: TextStyle(
              color: Colors.black,
              height: 1,
            )*/
        ),
      ),
    );
  }
}