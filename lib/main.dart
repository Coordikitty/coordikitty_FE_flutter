import 'package:animated_splash_screen/animated_splash_screen.dart';
//import 'package:coordikitty_fe_flutter/widgets/tabbar.dart';
//import 'package:coordikitty_fe_flutter/information.dart';
import 'follow.dart';
import 'login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'coordikitty',
        home: AnimatedSplashScreen(
          splash: Image(
            image: const AssetImage('image/coordikitty_logo.png'),
            width: screenWidth * 0.6,
            height: screenHeight * 0.6,
          ),
          duration: 0,
          //splashTransition: SplashTransition.scaleTransition,
          //splashTransition: SplashTransition.fadeTransition,
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Colors.white,
          nextScreen: Follow(),
          //nextScreen: Login(),
        )
    );
  }
}
