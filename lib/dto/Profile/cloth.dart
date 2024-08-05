// cloth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import '../../dto/Profile/cloth.dart';

class ClothService {
  Future<void> submitForm(
      XFile imageFile,
      String large,
      String medium,
      String small,
      String fit,
      String gender,
      String style,
      String thickness,
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accTk = prefs.getString('token');

      final closetPostRequestDto = ClosetPostRequestDto(
        large: large,
        medium: medium,
        small: small,
        fit: fit,
        gender: gender,
        style: style,
        thickness: thickness,
      );

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('http://your.api.url/closetPost'),
      );

      request.headers['Authorization'] = 'Bearer $accTk';
      request.headers['Accept'] = 'application/json';

      request.fields['closetPostRequestDto'] = jsonEncode(closetPostRequestDto.toJson());

      request.files.add(
        await http.MultipartFile.fromPath(
          'clothImg',
          imageFile.path,
          filename: 'cloth.jpg',
          contentType: MediaType('image', 'jpeg'),
        ),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) {
        throw Exception('Failed to upload cloth: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error uploading cloth: $e');
    }
  }
}

class ClosetPostRequestDto {
  String large;
  String medium;
  String small;
  String fit;
  String gender;
  String style;
  String thickness;

  ClosetPostRequestDto({
    required this.large,
    required this.medium,
    required this.small,
    required this.fit,
    required this.gender,
    required this.style,
    required this.thickness,
  });

  Map<String, dynamic> toJson() {
    return {
      'large': large,
      'medium': medium,
      'small': small,
      'fit': fit,
      'gender': gender,
      'style': style,
      'thickness': thickness,
    };
  }
}
