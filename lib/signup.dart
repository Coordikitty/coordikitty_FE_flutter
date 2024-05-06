import 'package:coordikitty_fe_flutter/widgets/duplecheckButton.dart';
import 'package:coordikitty_fe_flutter/widgets/signupbutton.dart';
import 'package:coordikitty_fe_flutter/widgets/signuptextform.dart';
import 'package:flutter/material.dart';

class  SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController nickname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password_match = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController birth = TextEditingController();
  final TextEditingController phone_number = TextEditingController();

  //final TextEditingController tall = TextEditingController();
  //final TextEditingController weight = TextEditingController();
  //final TextEditingController footSize = TextEditingController();
  //final TextEditingController preferredStyle = TextEditingController();

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
                  SizedBox(height: 30,),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                      children: [
                        Container(
                          width: screenWidth*(70/100),
                          child: SignUpTextForm(
                            controller: nickname,
                            text: '닉네임',
                            obscure: false,
                            textInputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: screenWidth*(30/100),
                          child: duplecheckButton(),
                        )
                      ]
                  ),
                  SizedBox(height: 30,),
                  Row(
                      children: [
                        Container(
                          width: screenWidth*(70/100),
                          child: SignUpTextForm(
                            controller: email,
                            text: '이메일',
                            obscure: false,
                            textInputType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: screenWidth*(30/100),
                          child: duplecheckButton(),
                        )
                      ]
                  ),
                  SizedBox(height: 30,),




                  /*
                SignUpTextForm(
                  controller: nickname,
                  text: '닉네임',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                SizedBox(width: 10,),

                SizedBox(height: 30,),
                SignUpTextForm(
                  controller: email,
                  text: '이메일',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                */
                  SizedBox(height: 30,),
                  SignUpTextForm(
                    controller: password,
                    text: '비밀번호',
                    obscure: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 15,),
                  Text(
                    '영문자, 숫자, 특수문자 조합의 8자리 이상',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 15,),
                  SignUpTextForm(
                    controller: password_match,
                    text: '비밀번호 재확인',
                    obscure: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 30,),
                  SignUpTextForm(
                    controller: name,
                    text: '이름',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 30,),
                  /*SignUpTextForm(
                  controller: birth_year,
                  text: '생년',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                SizedBox(width: 50,),
                SignUpTextForm(
                  controller: birth_month,
                  text: '월',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                SizedBox(width: 50,),*/
                  SignUpTextForm(
                    controller: birth,
                    text: '생년월일',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 30,),
                  SignUpTextForm(
                    controller: phone_number,
                    text: '연락처',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignUpButton(text: '확인', color: 0xffF83967),
                      SizedBox(width: 50,),
                      SignUpButton(text: '취소', color: 0xffAEAEAE),
                    ],
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),

          ),
        )
    );
  }
}
