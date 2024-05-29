import 'package:coordikitty_fe_flutter/widgets/findauthtextform.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FindAuth());
}

class FindAuth extends StatelessWidget {
  FindAuth({Key? key}) : super(key: key);

  final TextEditingController name = TextEditingController();
  final TextEditingController phone_number = TextEditingController();
  final TextEditingController certifyNumber = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('아이디/비밀번호 찾기'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: '이메일 찾기'),
                Tab(text: '비밀번호 찾기'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _buildEmailTab(),
              _buildPasswordTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTab() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        FindAuthTextForm(controller: name, text: '이름 입력'),
        FindAuthTextForm(controller: phone_number, text: '휴대전화번호 입력(\'-\')'),
        FindAuthTextForm(controller: certifyNumber, text: '인증번호 입력'),
        ElevatedButton(
          onPressed: () {
            // Implement logic to find email here
          },
          child: Text('이메일 찾기'),
        ),
      ],
    );
  }


  Widget _buildPasswordTab() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        FindAuthTextForm(controller: name, text: '이름 입력'),
        FindAuthTextForm(controller: email, text: '이메일 입력'),
        FindAuthTextForm(controller: certifyNumber, text: '인증번호 입력'),
        ElevatedButton(
          onPressed: () {
            // Implement logic to find password here
          },
          child: Text('비밀번호 찾기'),
        ),
      ],
    );
  }

  Widget _buildFormField(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            height: 1,
          ),
        ),
      ),
    );
  }
}