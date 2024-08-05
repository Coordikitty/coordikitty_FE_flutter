import 'package:flutter/material.dart';

class  InformationTextForm extends StatelessWidget {
  const InformationTextForm ({super.key, required this.controller, required this.textInputType});

  final TextEditingController controller;
  final TextInputType textInputType;

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
              blurRadius: 7
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          //hintText: text,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          /*hintStyle: TextStyle(
              color: Colors.black,
              height: 1,
            )*/
        ),
      ),
    );
  }
}