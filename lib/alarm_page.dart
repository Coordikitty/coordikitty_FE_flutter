import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Page'),
      ),
      body: Center(
        child: Text('This is the Alarm Page'),
      ),
    );
  }
}