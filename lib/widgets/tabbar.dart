import 'package:flutter/material.dart';

void main() {
  runApp(Tabbar());
}

class Tabbar extends StatelessWidget {
  Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: [
              Center(child: Text('Home')),
              Center(child: Text('Search')),
              Center(child: Text('Categories')),
              Center(child: Text('Bookmarks')),
              Center(child: Text('Profile')),
            ],
          ),
          bottomNavigationBar: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            tabs: [
              Tab(icon: ImageIcon(AssetImage('image/home.png'), size: 20)),
              Tab(icon: ImageIcon(AssetImage('image/search.png'), size: 20)),
              Tab(icon: ImageIcon(AssetImage('image/cat.png'), size: 20)),
              Tab(icon: ImageIcon(AssetImage('image/bookmark.png'), size: 20)),
              Tab(icon: ImageIcon(AssetImage('image/person.png'), size: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
