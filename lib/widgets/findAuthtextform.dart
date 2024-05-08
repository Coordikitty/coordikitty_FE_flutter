import 'package:flutter/material.dart';

class FindAuthTextForm extends StatelessWidget {
  const FindAuthTextForm({super.key, required this.controller, required this.text});

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(
                color: Colors.grey,
                height: 1,
              ),
            ),
          ),
          SizedBox(height: 20),
          
        ],
      ),
    );
  }
}
