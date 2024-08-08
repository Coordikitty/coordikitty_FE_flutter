import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../widget/snackbar.dart';

class DupcheckService {
  final Dio _dio = Dio();
  final String url = 'http://ec2-3-36-29-29.ap-northeast-2.compute.amazonaws.com:8080/user/signUp/dupCheck';

  Future<bool?> checkDuplicate(BuildContext context, String value, bool isEmail) async {
    try {
      final queryParams = isEmail ? {'email': value} : {'nickname': value};
      final response = await _dio.get(url, queryParameters: queryParams);

      if (response.statusCode == 200) {
        final responseBody = response.data;
        print('Response data: $responseBody');
        if (responseBody is bool) {
          return responseBody;
        }
      } else {
        print('Error: Server returned status code ${response.statusCode}');
        showSnackBar(context, '서버 응답 오류');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      showSnackBar(context, '중복확인 중 오류 발생');
      return null;
    }
  }
}