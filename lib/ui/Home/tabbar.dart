import 'package:coordikitty_fe_flutter/ui/Home/recommend.dart';
import 'package:flutter/material.dart';

import '../Bookmark/bookmark.dart';
import '../MyPage/mypage.dart';
import '../Search/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabbar(),
    );
  }
}

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            Recommend(), //오늘의 추천(홈)
            Search(), //검색
            Bookmark(), //북마크
            MyPage(), //프로필
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
                Tab(icon: ImageIcon(AssetImage('image/cat.png'), size: 20)),
                //Tab(icon: ImageIcon(AssetImage('image/home.png'), size: 20)),
                Tab(icon: ImageIcon(AssetImage('image/search.png'), size: 20)),
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
