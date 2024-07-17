import 'package:flutter/material.dart';
import 'package:coordikitty_fe_flutter/style.dart';

class InformationButton extends StatelessWidget {
  const InformationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Style()));
      },
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
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
