import 'package:coordikitty_fe_flutter/Bookmark/bookmark_page.dart';
import 'package:coordikitty_fe_flutter/Recommend/cat_page.dart';
import 'package:coordikitty_fe_flutter/Profile/profile_page.dart';
import 'package:coordikitty_fe_flutter/Search/search_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Follow(),
    );
  }
}

class Follow extends StatefulWidget {
  const Follow({super.key});

  @override
  _FollowState createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: [
            HomePage(),
            SearchPage(),
            CatPage(),
            BookmarkPage(),
            ProfilePage(),
          ],
        ),
        /* 하단 탭바 */
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 1.0,
              thickness: 0.5,
              color: Colors.grey[850],
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.grey[850],
              tabs: [
                Tab(icon: ImageIcon(AssetImage('image/home.png'), size: 20)),
                Tab(icon: ImageIcon(AssetImage('image/search.png'), size: 20)),
                Tab(icon: ImageIcon(AssetImage('image/cat.png'), size: 20)),
                Tab(icon: ImageIcon(AssetImage('image/bookmark.png'), size: 20)),
                Tab(icon: ImageIcon(AssetImage('image/person.png'), size: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
