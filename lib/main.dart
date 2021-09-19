import 'package:flutter/material.dart';
import 'package:happybirthday_app/next_screen.dart';
import 'package:happybirthday_app/starting_screen.dart';

void main(){
  runApp(HappyBirthDay());
}
class HappyBirthDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartingScreen(),
      routes: {
        NextScreen.routeName: (context)=> NextScreen(),
      },
    );
  }
}
