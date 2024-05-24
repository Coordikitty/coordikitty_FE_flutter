import 'package:flutter/material.dart';
import 'package:coordikitty_fe_flutter/widgets/FeedButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFollowing = false;
  int likeCount = 1524;
  bool isLiked = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
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
            /* 프로필 (이미지, 닉네임, 팔로우 버튼) */
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('image/haengraejo.png'),
                  radius: 20.0,
                ),
                SizedBox(width: 15),
                Text(
                  'haengraejo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80, 25),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: toggleFollow,
                  child: Image(
                    width: 80,
                    height: 25,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      isFollowing ? 'image/following.png' : 'image/follow.png',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            /* 피드 */
            Image(image: AssetImage('image/feed1.png')),
            SizedBox(height: 10),
            Text(
              'OOTD',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),

            /* 좋아요, 북마크 */
            Row(
              children: [
                FeedButton(
                  text: 'Like',
                  isLiked: isLiked,
                  onTap: toggleLike,
                ),
                SizedBox(width: 5,),
                Text(
                  '$likeCount',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                FeedButton(
                  text: 'Bookmark',
                  isLiked: false,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            // Feed Image
            Image.asset('image/feed2.png'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

