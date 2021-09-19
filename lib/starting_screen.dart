import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:happybirthday_app/next_screen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:confetti/confetti.dart';
import 'package:shimmer/shimmer.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {

  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;
  Timer _time;
  int _start = 5;

  void StartTimer() {
    const onesec = const Duration(seconds: 3);
    _time = new Timer.periodic(onesec, (Timer time) {
      setState(() {
       if(_start < 1){
          _controllerCenterRight.play();
          _controllerCenterLeft.play();
          _time.cancel();
       }else{
         _start = _start - 1 ;
       }

      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    StartTimer();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: BottomAppBar(
          color: Color.fromRGBO(21, 45, 53, 1),
          shape: CircularNotchedRectangle(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NextScreen.routeName);
        },
        child: Icon(
          FlutterIcons.play_circle_outline_mdi,
          color: Colors.white,
          size: 55,
        ),
        backgroundColor: Color.fromRGBO(52, 91, 99, 0.4),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 360,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bob1.jpeg'),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.topCenter,
              child:Text(_start == 0?'':'${_start}',style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 50,
              ),
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ConfettiWidget(
                  confettiController: _controllerCenterRight,
                  blastDirection: pi,
                  particleDrag: 0.05,
                  emissionFrequency: 0.05,
                  numberOfParticles: 20,
                  gravity: 0.5,
                  shouldLoop: false, // start again as soon as the animation is finished
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ], // manually specify the colors to be used
                  //createParticlePath: drawStar, // define a custom shape/path.
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ConfettiWidget(
                  confettiController: _controllerCenterLeft,
                  blastDirection: 0,
                  particleDrag: 0.05,
                  emissionFrequency: 0.6,
                  minimumSize: const Size(10, 10),
                  maximumSize: const Size(30, 30),
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ],
                  numberOfParticles: 1,
                  gravity: 0.5,// manually specify the colors to be used
                  //createParticlePath: drawStar, // define a custom shape/path.
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Shimmer.fromColors(
                        baseColor: Colors.black,
                        highlightColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Happy Birthday', style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900,
                            ),),
                            SizedBox(width: 10,),
                            Icon(Icons.cake_rounded, size: 25, color:Colors.white,),
                            Icon(Icons.cake_rounded, size: 25, color:Colors.white,),
                            Icon(Icons.cake_rounded, size: 25, color:Colors.white,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
