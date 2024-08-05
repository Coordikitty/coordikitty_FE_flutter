import 'package:flutter/material.dart';
import '../../dto/Auth/preferredstyle.dart';
import '../../widget/Auth/preferredstylebutton.dart';

class PreferredStyle extends StatefulWidget {
  const PreferredStyle({
    super.key,
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
  });

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
  State<PreferredStyle> createState() => _PreferredStyleState();
}

class _PreferredStyleState extends State<PreferredStyle> {
  List<String> selectedImages = [];

  // 선호 사진 이미지 리스트
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

  void _confirmSelection() {
    final signupDTO = PreferredStyleDTO(
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
      footSize: widget.footSize,
    );

    signupDTO.confirmSelection(context, selectedImages);
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
                PreferredStyleButton(
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