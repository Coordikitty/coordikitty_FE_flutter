import 'package:flutter/material.dart';
import '../Profile/alarm_page.dart';
import '../Profile/setting_page.dart';
import '../Profile/post_page.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    String imagePath;
    VoidCallback? onTap;

    if (text == 'alarm') {
      imagePath = 'image/alarm.png';
      onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlarmPage()),
        );
      };
    } else if (text == 'posting') {
      imagePath = 'image/posting.png';
      onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostPage()),
        );
      };
    } else if (text == 'setting') {
      imagePath = 'image/setting.png';
      onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingPage()),
        );
      };
    } else {
      return SizedBox();
    }

    return InkWell(
      onTap: onTap,
      child: ImageIcon(
        AssetImage(imagePath),
        size: 20,
      ),
    );
  }
}
