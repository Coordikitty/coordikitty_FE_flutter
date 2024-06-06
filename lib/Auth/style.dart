import 'package:coordikitty_fe_flutter/dto/signupdto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Home/follow.dart';
import '../dto/restclient.dart';
import 'login.dart';

class Style extends StatefulWidget {
  const Style({
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
  final int tall;
  final int weight;
  final int footSize;

  @override
  _StyleState createState() => _StyleState();
}

class _StyleState extends State<Style> {
  List<String> selectedImages = [];

  final List<String> predefinedImages = [
    'image/clothes/style_1.png',
    'image/clothes/style_2.png',
    'image/clothes/style_3.png',
    'image/clothes/style_4.png',
    'image/clothes/style_5.png',
    'image/clothes/style_6.png',
    'image/clothes/style_7.png',
  ];

  void _selectImage(String imageName) {
    setState(() {
      if (selectedImages.contains(imageName)) {
        selectedImages.remove(imageName);
      } else {
        if (selectedImages.length < 3) {
          selectedImages.add(imageName);
        }
      }
    });
  }

  Future<void> _confirmSelection() async {
    if (selectedImages.length != 3) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('선호하는 스타일의 사진을 3개 선택하여 주세요'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      try {
        final dio = Dio();
        final restClient = RestClient(dio);


        final signupDTO = SignupDTO(
            email: widget.email,
            password: widget.password,
            nickname: widget.nickname,
            name: widget.name,
            year: widget.year,
            month: widget.month,
            day: widget.day,
            phoneNumber: widget.phoneNumber,
            tall: widget.tall,
            weight: widget.weight,
            footSize: widget.footSize);

        final response = await restClient.signupRequest(signupDTO);
        
        if (response == '회원가입 성공') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('회원가입이 완료되었습니다')),
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('회원가입 실패: $e')),
        );
      }
    }
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
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '선호하는 스타일의 사진을 3개 선택해 주세요',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: predefinedImages.length,
                  itemBuilder: (context, index) {
                    String imageName = predefinedImages[index];
                    return GestureDetector(
                      onTap: () => _selectImage(imageName),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: selectedImages.contains(imageName) ? Color(0xffF83967) : Colors.transparent, width: 3.0),
                        ),
                        child: Image.network(
                          imageName,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30,),
                StyleButton(
                  onPressed: _confirmSelection,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StyleButton extends StatelessWidget {
  const StyleButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
}
