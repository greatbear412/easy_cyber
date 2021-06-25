import 'package:flutter/material.dart';
import 'package:easy_cyber/easy_cyber.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: CyberExample(),
    );
  }
}

class CyberExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: CyberPunk(
          child: Image(image: AssetImage('imgs/panda_cyber.webp')),
          dur: 500,
          cyberItemCount: 10,
          infinite: true,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
      ),
    ));
    // }
  }
}
