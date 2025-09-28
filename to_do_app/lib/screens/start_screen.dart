import 'package:flutter/material.dart';
import 'splash_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 50),
            Text(
              'UP TODO',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'Manage your tasks efficiently',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Login_Screen');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Login'),
            ),

            // second button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Login_Screen');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Create Account'),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
