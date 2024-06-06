import 'package:coordikitty_fe_flutter/Profile/cloth_page.dart';
import 'package:coordikitty_fe_flutter/Profile/post_page.dart';
import 'package:coordikitty_fe_flutter/Profile/setting_page.dart';
import 'package:flutter/material.dart';

import 'alarm_page.dart';
import 'load_closet.dart';
import 'load_feed.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool postButtonClicked = true;
  bool closetButtonClicked = false;

  void togglePostButton() {
    setState(() {
      postButtonClicked = true;
      closetButtonClicked = false;
    });
  }

  void toggleClosetButton() {
    setState(() {
      postButtonClicked = false;
      closetButtonClicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* 닉네임, 알람, 게시물 등록, 설정 버튼 */
            Row(
              children: [
                Text(
                  'ive_wonyoung',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                ProfileButton(text: 'alarm'),
                SizedBox(width: 15),
                ProfileButton(text: 'posting'),
                SizedBox(width: 15),
                ProfileButton(text: 'setting'),
              ],
            ),
            SizedBox(height: 20),

            /* 프로필 (이미지, 게시물, 팔로워, 팔로잉) */
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('image/ive.png'),
                  radius: 45.0,
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      '100',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '게시물',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      '400',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '팔로워',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      '500',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '팔로잉',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer()
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                MyprofileButton(
                  text: 'post',
                  isClicked: postButtonClicked,
                  onTap: togglePostButton,
                ),
                Spacer(),
                MyprofileButton(
                  text: 'closet',
                  isClicked: closetButtonClicked,
                  onTap: toggleClosetButton,
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 10,),
            Divider(
              height: 1.0,
              thickness: 0.5,
              color: Colors.grey[850],
            ),
            SizedBox(height: 5,),
            if (postButtonClicked) LoadFeed(),
            if (closetButtonClicked) LoadCloset(),
          ],
        ),
      ),
    );
  }
}

class MyprofileButton extends StatelessWidget {
  final String text;
  final bool isClicked;
  final VoidCallback onTap;

  const MyprofileButton({
    Key? key,
    required this.text,
    required this.isClicked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath;
    if (text == 'closet') {
      imagePath = isClicked ? 'image/selected_closet.png' : 'image/closet.png';
    } else {
      imagePath = isClicked ? 'image/selected_post.png' : 'image/post.png';
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
                      MaterialPageRoute(builder: (context) => PostPage()),
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
                      MaterialPageRoute(builder: (context) => ClothPage()),
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
        size: 35,
      ),
    );
  }
}