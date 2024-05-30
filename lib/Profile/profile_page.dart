import 'package:coordikitty_fe_flutter/widgets/myprofilebutton.dart';
import 'package:coordikitty_fe_flutter/widgets/profilebutton.dart';
import 'package:flutter/material.dart';

import 'load_closet.dart';
import 'load_feed.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool postButtonClicked = false;
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
                  'haengraejo',
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
                  backgroundImage: AssetImage('image/haengraejo.png'),
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
