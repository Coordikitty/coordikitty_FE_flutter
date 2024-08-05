import 'package:flutter/material.dart';

class LoginTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool obscure;
  final TextInputType textInputType;

  const LoginTextForm({
    Key? key,
    required this.controller,
    required this.text,
    required this.obscure,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const LoginButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
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
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}