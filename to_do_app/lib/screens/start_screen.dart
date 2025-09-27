import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // 1. Added an AppBar as requested
      appBar: AppBar(
        title: const Text('Start Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        // 2. Removed the 'Center' widget
        child: Column(
          // Aligns the text to the left
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 3. Added your Text widget at the top
            const Text(
              'Welcome to Uptodo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Login to your account /n or create new account to continue',
              style: TextStyle(
                color: const Color.fromARGB(255, 225, 150, 127),
                fontSize: 12,
              ),
            ),

            const Spacer(),

            // Your existing buttons
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50), // Makes button wider
              ),
              child: const Text('Login'),
            ),

            const SizedBox(height: 16), // Added for spacing

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
