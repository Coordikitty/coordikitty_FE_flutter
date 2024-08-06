import 'package:coordikitty_fe_flutter/dto/Auth/signup.dart';
import 'package:flutter/material.dart';
import '../../widget/Auth/dupcheckbutton.dart';
import 'information.dart';
import 'login.dart';
import '../../widget/snackbar.dart';
import '../../widget/Auth/signupform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final SignUpDTO signUpDTO = SignUpDTO();


  final TextEditingController nickname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordMatch = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController month = TextEditingController();
  final TextEditingController day = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  bool isNicknameChecked = false;
  bool isEmailChecked = false;

  void handleSignUp() {
    print("SignUp button pressed");
    if (nickname.text.isEmpty || email.text.isEmpty || password.text.isEmpty || passwordMatch.text.isEmpty || name.text.isEmpty || year.text.isEmpty || month.text.isEmpty || day.text.isEmpty || phoneNumber.text.isEmpty) {
      showSnackBar(context, '모든 필드를 채워주세요.');
      return;
    }

    if (!isNicknameChecked || !isEmailChecked) {
      showSnackBar(context, '닉네임과 이메일 중복확인을 해주세요.');
      return;
    }

    if (password.text != passwordMatch.text) {
      showSnackBar(context, '비밀번호가 일치하지 않습니다.');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Information(
        email: email.text,
        password: password.text,
        passwordMatch: passwordMatch.text,
        nickname: nickname.text,
        name: name.text,
        year: int.parse(year.text),
        month: int.parse(month.text),
        day: int.parse(day.text),
        phoneNumber: phoneNumber.text,
      )),
    );
  }

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
                SizedBox(height: 30),
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
                SizedBox(height: 30),
                Row(
                  children: [
                    Flexible(
                      flex: 7,
                      child: SignUpTextForm(
                        controller: nickname,
                        text: '닉네임',
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 3,
                      child: DupleCheckButton(
                        controller: nickname,
                        isEmail: false,
                        onChecked: (bool result) {
                          setState(() {
                            isNicknameChecked = result;
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Flexible(
                      flex: 7,
                      child: SignUpTextForm(
                        controller: email,
                        text: '이메일',
                        obscure: false,
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 3,
                      child: DupleCheckButton(
                        controller: email,
                        isEmail: true,
                        onChecked: (bool result) {
                          setState(() {
                            isEmailChecked = result;
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                SignUpTextForm(
                  controller: password,
                  text: '비밀번호',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 15),
                Text(
                  '영문자, 숫자, 특수문자 조합의 8자리 이상',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                SignUpTextForm(
                  controller: passwordMatch,
                  text: '비밀번호 재확인',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 30),
                SignUpTextForm(
                  controller: name,
                  text: '이름',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Flexible(
                      child: SignUpTextForm(
                        controller: year,
                        text: '연도',
                        obscure: false,
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: SignUpTextForm(
                        controller: month,
                        text: '월',
                        obscure: false,
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: SignUpTextForm(
                        controller: day,
                        text: '일',
                        obscure: false,
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                SignUpTextForm(
                  controller: phoneNumber,
                  text: '연락처',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: handleSignUp,
                      child: AuthButton(
                        text: '확인',
                        color: 0xffF83967,
                        onPressed: handleSignUp,
                      ),
                    ),
                    SizedBox(width: 50),
                    AuthButton(
                      text: '취소',
                      color: 0xffAEAEAE,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login())),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
