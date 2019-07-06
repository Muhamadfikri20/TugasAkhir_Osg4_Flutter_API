import 'package:flutter/material.dart';
import 'package:muhamadfikri_finalproject_flutter/tampilan/welcome.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  first createState() => first();
}

class first extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Welcome());
  }
}
