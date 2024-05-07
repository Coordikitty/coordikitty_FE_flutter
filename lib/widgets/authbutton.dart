import 'package:flutter/material.dart';

import '../information.dart';
import '../login.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.text, required this.color});

  final String text;
  final int color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(text == '확인')
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
        else if(text == '취소')
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
      },

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
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
