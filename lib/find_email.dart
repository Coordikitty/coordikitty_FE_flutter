import 'package:coordikitty_fe_flutter/widgets/verifybutton.dart';
import 'package:flutter/material.dart';
import 'package:coordikitty_fe_flutter/widgets/find_emailtextform.dart';

class Find_Email extends StatefulWidget {

  @override
  State<Find_Email> createState() => _Find_EmailState();
}

class _Find_EmailState extends State<Find_Email> {
  bool? _verifyUsePhone = false;

  final TextEditingController name = TextEditingController();
  final TextEditingController phone_number = TextEditingController();
  final TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {

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
                    '이메일 찾기',
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
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      value: _verifyUsePhone,
                      onChanged: (value) {
                        setState(() {
                          _verifyUsePhone = value;
                        });
                      },),
                    Text('가입한 휴대폰으로 찾기'),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('이름'),
                    SizedBox(width: 15,),
                    Find_EmailTextForm(controller: name, textInputType: TextInputType.text, obscure: false)
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('휴대전화'),
                    SizedBox(width: 15,),
                    Find_EmailTextForm(controller: phone_number, textInputType: TextInputType.phone, obscure: false),
                    verifyButton(text: '인증번호 받기')
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('인증번호'),
                    SizedBox(width: 15,),
                    Find_EmailTextForm(controller: msg, textInputType: TextInputType.text, obscure: false),
                    verifyButton(text: '인증')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
