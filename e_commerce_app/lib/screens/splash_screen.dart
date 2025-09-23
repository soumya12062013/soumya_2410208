import 'dart:async'; // Required for Timer or Future.delayed
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce_app/main.dart';
import 'signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // This method is called once when the widget is inserted into the widget tree.
  @override
  void initState() {
    super.initState();
    // Create a timer that will navigate to the main screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthScreen(),
          ), // Navigate to AuthScreen
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the same theme color for consistency
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your App Logo
            const Icon(Iconsax.shopping_bag, size: 80, color: Colors.white),
            const SizedBox(height: 20),

            // Your App Name
            Text(
              'Stylo',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 80),

            // A loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
