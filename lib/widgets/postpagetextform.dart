/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../dto/closetdto.dart';

class PostPageTextForm extends StatefulWidget {
  const PostPageTextForm({Key? key}) : super(key: key);

  @override
  _PostPageTextFormState createState() => _PostPageTextFormState();
}

class _PostPageTextFormState extends State<PostPageTextForm> {
  final _formKey = GlobalKey<FormState>();

  Large? _large;
  Medium? _medium;
  Small? _small;
  Fit? _fit;
  Gender? _gender;
  Style? _style;
  Thickness? _thickness;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create DTO object
      final closetPostRequestDTO = ClosetPostRequestDTO(
        large: _large!,
        medium: _medium!,
        small: _small!,
        fit: _fit!,
        gender: _gender!,
        style: _style!,
        thickness: _thickness!,
      );

      // Convert DTO object to JSON
      final jsonData = closetPostRequestDTO.toJson();

      // Send JSON data to the server
      final response = await http.post(
        Uri.parse('YOUR_SERVER_ENDPOINT_HERE'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(jsonData),
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Handle success
        print('Data sent successfully');
      } else {
        // Handle failure
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown form fields
            // ...

            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text('등록'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/