import 'package:flutter/material.dart';
import 'package:to_do_app/screens/splash_screen.dart';
import 'package:to_do_app/screens/start_screen.dart';
import 'package:to_do_app/screens/login_screen.dart';
import 'package:to_do_app/screens/create_acc_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'Splash_Screen',
      debugShowCheckedModeBanner: false,
      routes: {
        'Splash_Screen': (context) => SplashScreen(),
        'Start_Screen': (context) => StartScreen(),
        'Login_Screen': (context) => LoginScreen(),
        'Create_Acc_Screen': (context) => CreateAccScreen(),
      },
    ),
  );
}
