import 'package:coordikitty_fe_flutter/service/Auth/dupcheck.dart';
import 'package:flutter/material.dart';
import '../../dto/Auth/dupcheck.dart';
import '../snackbar.dart';

class DupleCheckButton extends StatelessWidget {
  final TextEditingController controller;
  final bool isEmail;
  final ValueChanged<bool> onChecked;

  const DupleCheckButton({
    super.key,
    required this.controller,
    required this.isEmail,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (controller.text.isEmpty) {
          showSnackBar(context, '값을 입력하세요.');
        } else {
          DupcheckDTO dupcheckDTO = DupcheckDTO();
          DupcheckService dupcehckService = DupcheckService();
          bool? isDuplicate = await dupcehckService.checkDuplicate(context, controller.text, isEmail);

          if (isDuplicate == null) {
            onChecked(false);
          } else if (isDuplicate) {
            showSnackBar(context, '사용하실 수 있습니다');
            onChecked(true);
          } else {
            if (isEmail) {
              showSnackBar(context, '중복되는 이메일로 가입한 이력이 있습니다');
            } else {
              showSnackBar(context, '중복되는 닉네임입니다');
            }
            onChecked(false);
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: Colors.blue,
        child: const Text(
          '중복확인',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
