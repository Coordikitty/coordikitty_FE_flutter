import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../dto/restclient.dart';
import 'information.dart';
import 'login.dart';

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
                    Flexible(
                      flex: 7,
                      child: SignUpTextForm(
                        controller: nickname,
                        text: '닉네임',
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                    ),
                    SizedBox(width: 10,),
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
                SizedBox(height: 30,),
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
                    SizedBox(width: 10,),
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15,),
                SignUpTextForm(
                  controller: passwordMatch,
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
                    SizedBox(width: 10,),
                    Flexible(
                      child: SignUpTextForm(
                        controller: month,
                        text: '월',
                        obscure: false,
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10,),
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
                SizedBox(height: 30,),
                SignUpTextForm(
                  controller: phoneNumber,
                  text: '연락처',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _signup(context);
                      },
                      child: AuthButton(
                        text: '확인',
                        onPressed: () => _signup(context),
                        color: 0xffF83967,
                      ),
                    ),
                    SizedBox(width: 50,),
                    AuthButton(
                      text: '취소',
                      color: 0xffAEAEAE,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login())),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signup(BuildContext context) async {

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
        nickname: nickname.text,
        name: name.text,
        year: int.parse(year.text),
        month: int.parse(month.text),
        day: int.parse(day.text),
        phoneNumber: phoneNumber.text,
      )),
    );

  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

class DupleCheckButton extends StatelessWidget {
  final TextEditingController controller;
  final bool isEmail;
  final ValueChanged<bool> onChecked;

  DupleCheckButton({
    required this.controller,
    required this.isEmail,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (controller.text.isEmpty) {
          showSnackBar(context, '값을 입력하세요.');
        } else {
          bool? isDuplicate = await checkDuplicate(context, controller.text, isEmail);

          if (isDuplicate == null) {
            showSnackBar(context, '서버 응답을 처리하는 동안 오류가 발생했습니다.');
            onChecked(false);
          } else if (isDuplicate) {
            showSnackBar(context, '사용하실 수 있습니다');
            onChecked(true);
          } else {
            if (isEmail) {
              showSnackBar(context, '중복되는 이메일로 가입한 이력이 있습니다');
            } else {
              showSnackBar(context, '중복되는 닉네임이 있습니다');
            }
            onChecked(false);
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
            ),
          ],
        ),
        child: Text(
          '중복확인',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<bool?> checkDuplicate(BuildContext context, String value, bool isEmail) async {
    try {
      final dio = Dio();
      final restClient = RestClient(dio);
      Map<String, dynamic> queryParams = isEmail ? {'email': value} : {'nickname': value};

      final response = await restClient.DupcheckRequest(queryParams);

      return response;
    } catch (e) {
      print('Error: $e');
      showSnackBar(context, '중복확인 중 오류가 발생했습니다.');
      return null;
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

class SignUpTextForm extends StatelessWidget {
  const SignUpTextForm({
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure,
  });

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

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
            blurRadius: 7,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          hintStyle: TextStyle(
            color: Colors.black,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String text;
  final int color;
  final VoidCallback? onPressed;

  const AuthButton({required this.text, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          color: Color(color),
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
