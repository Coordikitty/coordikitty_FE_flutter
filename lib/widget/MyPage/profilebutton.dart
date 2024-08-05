import 'package:flutter/material.dart';

import '../../ui/MyPage/alarm.dart';
import '../../ui/MyPage/cloth.dart';
import '../../ui/MyPage/post.dart';
import '../../ui/MyPage/settong.dart';

/*설정 버튼*/
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
          MaterialPageRoute(builder: (context) => Alarm()),
        );
      };
    } else if (text == 'posting') {
      imagePath = 'image/posting.png';
      onTap = () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.post_add),
                  title: Text("게시물 등록"),
                  onTap: () {
                    Navigator.pop(context); // Close the bottom sheet
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Post()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text("옷 등록"),
                  onTap: () {
                    Navigator.pop(context); // Close the bottom sheet
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cloth()),
                    );
                  },
                ),
              ],
            );
          },
        );
      };
    } else if (text == 'setting') {
      imagePath = 'image/setting.png';
      onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Setting()),
        );
      };
    } else {
      return SizedBox();
    }

    return InkWell(
      onTap: onTap,
      child: ImageIcon(
        AssetImage(imagePath),
        size: 35,
      ),
    );
  }
}