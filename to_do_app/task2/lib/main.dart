import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'screens/create_acc_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/start_screen.dart';
import 'screens/main_screen.dart';
import 'screens/task_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: 'Splash_Screen',
      debugShowCheckedModeBanner: false,
      routes: {
        'Splash_Screen': (context) => SplashScreen(),
        'Start_Screen': (context) => StartScreen(),
        'Login_Screen': (context) => LoginScreen(),
        'Create_Acc_Screen': (context) => CreateAccScreen(),
        'Main_Screen': (context) => MainScreen(),
        'Task_Screen': (context) => TaskScreen(),
      },
    ),
  );
}
