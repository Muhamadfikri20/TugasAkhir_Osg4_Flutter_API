import 'dart:async';
//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:muhamadfikri_finalproject_flutter/tampilan/home/home.dart';

class Welcome extends StatefulWidget {
  @override
  splash createState() => new splash();
}

class splash extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 10);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return Home();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       backgroundColor: Colors.white,
      body: new Center(
        child: new Image.asset('assets/logo.jpg'),
      ),
    );
  }
}
