import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'UP TODO',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
