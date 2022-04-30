import 'package:dayone/modules/callpage.dart';
import 'package:flutter/material.dart';
import 'package:dayone/modules/homepage.dart';

void main(){
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}