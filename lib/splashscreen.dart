import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin()async{
    await Future.delayed(Duration(milliseconds: 0), () {});
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Coordikitty',
                style: TextStyle(color: Colors.black, fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
              Image(
                image: const AssetImage('image/coordikitty_logo.png'),
                width: screenWidth * 0.6,
                height: screenHeight * 0.6,
              ),
            ],
          )
      ),
    );
  }
}