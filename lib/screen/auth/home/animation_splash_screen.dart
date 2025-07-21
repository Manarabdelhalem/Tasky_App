import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/screen/auth/home/onboarding_screen.dart';
// import 'package:lasttask/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              child: Image.asset('assets/icons/Task-icon.png'),
              duration: const Duration(milliseconds: 900),
            ),
            BounceInDown(
              from: 50,
              delay: const Duration(milliseconds: 900),
              duration: const Duration(milliseconds: 600),
              child: Image.asset('assets/icons/y-icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}
