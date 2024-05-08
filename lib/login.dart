import 'package:coordikitty_fe_flutter/widgets/loginbutton.dart';
import 'package:coordikitty_fe_flutter/widgets/logintextform.dart';
import 'package:coordikitty_fe_flutter/widgets/sociallogin.dart';
import 'package:coordikitty_fe_flutter/findAuth.dart';
import 'package:flutter/material.dart';



class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //var screenHeight = MediaQuery.of(context).size.height;
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
                SizedBox(height: 50,),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: Color(0xffD1D1D1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15,),
                LoginTextForm(
                  controller: email,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 6,),
                LoginTextForm(
                  controller: password,
                  text: 'password',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 15,),
                Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text(
                      '이메일/비밀번호를 잊으셨나요?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute( builder: (BuildContext context) => FindAuth()));
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginButton(text: '회원가입',),
                    SizedBox(width: 50,),
                    LoginButton(text: '로그인',),
                  ],
                ),
                SizedBox(height: 50,),
                SocialLogin(),
                Align(child:
                Text(
                  "이용약관 | 개인정보처리방침 | 청소년보호정책",
                  style: TextStyle(
                      fontSize: screenWidth*(14/360),
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
          children: <Widget>[
            // 로그인 text widget
            Container(
              width: 150,
              height: 250,
              child: Center(
                child: Text('로그인',
                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
            ),

            // 로그인 입력 field widget
            Container(
              child: Theme(
                data: ThemeData(
                    primaryColor: Color(0xE0E0E0E0),
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                            color: Color(0xE0E0E0E0),
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold
                        )
                    )
                ),
                child: Container(
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: '이메일 입력'
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                            labelText: '비밀번호 입력'
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Text('이메일/비밀번호를 잊으셨나요?',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                      SizedBox(height: 30.0,),
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  child: Text('회원가입',
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
                                  }),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  child: Text('로그인',
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
                                  onPressed: (){
                                    if(email.text == '서버 아이디' && password.text == '서버 비밀번호')
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Information()));
                                    else
                                      showSnackBar(context);
                                  })
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              child: Text("이용약관 | 개인정보처리방침 | 청소년보호정책",
                  style: TextStyle(fontSize: screenWidth*(14/360), color: Color.fromRGBO(255, 255, 255, 0.6),)
              ),
            ),
          ],
        )
    );
  }
}

void showSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text('로그인 정보를 다시 확인하세요',  // 아이디(이메일) 불일치 || 비밀번호 불일치
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.grey,
      )
  );
}
*/
