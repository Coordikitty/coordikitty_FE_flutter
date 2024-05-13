import 'package:coordikitty_fe_flutter/widgets/informationtextform.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  Information({super.key});

  final TextEditingController tall = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController footSize = TextEditingController();
  //final TextEditingController preferredStyle = TextEditingController();

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
                InformationTextForm(controller: tall, textInputType: TextInputType.text),
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
                InformationTextForm(controller: tall, textInputType: TextInputType.text),
                SizedBox(height: 30,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
