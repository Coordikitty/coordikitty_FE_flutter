import 'package:flutter/material.dart';

import '../../ui/Auth/preferredstyle.dart';

class InformationButton extends StatelessWidget {
  const InformationButton({
    Key? key,
    required this.email,
    required this.password,
    required this.passwordMatch,
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
  final String passwordMatch;
  final String nickname;
  final String name;
  final int year;
  final int month;
  final int day;
  final String phoneNumber;
  final TextEditingController tall;
  final TextEditingController weight;
  final TextEditingController footSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_validateForm(context)) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PreferredStyle(
                email: email,
                password: password,
                nickname: nickname,
                name: name,
                year: year,
                month: month,
                day: day,
                phoneNumber: phoneNumber,
                tall: int.parse(tall.text),
                weight: int.parse(weight.text),
                footSize: int.parse(footSize.text),
              ),
            ),
          );
        }
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
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  bool _validateForm(BuildContext context) {
    if (tall.text.isEmpty || weight.text.isEmpty || footSize.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill out all fields.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.grey,
        ),
      );
      return false;
    }
    return true;
  }
}
