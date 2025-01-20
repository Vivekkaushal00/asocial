import 'dart:async';

import 'package:asocial/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Image.asset('assets/splash.png', fit: BoxFit.cover),
      ),
    );
  }
}
