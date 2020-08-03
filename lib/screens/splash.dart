import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _imageAnimationController;
  Animation<double> _imageAnimation;

  @override
  void initState() {
    super.initState();
    _imageAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _imageAnimation = new CurvedAnimation(
        parent: _imageAnimationController, curve: Curves.easeInToLinear);
    _imageAnimation.addListener(() => this.setState(() {}));
    _imageAnimationController.forward();

    Timer(
        Duration(seconds: 3),
        //() => print('Splash Done!.')
        route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/splash_bg.png'),
              fit: BoxFit.cover),
        ),
        child: Container(),
      ),
    );
  }
}
