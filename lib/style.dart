import 'package:flutter/material.dart';

class Style extends StatelessWidget {
  const Style({super.key});

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
                    '선호하는 스타일의 사진을 3개 이상 선택해 주세요',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // 이미지 추가
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
