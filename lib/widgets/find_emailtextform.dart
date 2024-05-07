import 'package:flutter/material.dart';

class Find_EmailTextForm extends StatelessWidget {
  const Find_EmailTextForm({super.key, required this.controller, required this.textInputType, required this.obscure});

  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
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
        obscureText: obscure,
      ),
    );
  }
}
