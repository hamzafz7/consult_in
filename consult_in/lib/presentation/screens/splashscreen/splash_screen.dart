import 'package:consult_in/components/theme.dart';
import 'package:consult_in/presentation/screens/onboardingscreen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key, this.islogin});
  bool? islogin;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: mycolor,
        splashIconSize: w,
        splash: Column(
          children: [
            Image.asset(
              "assets/images/second_logo.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
        nextScreen: const OnBoardingScreen(),
      ),
    );
  }
}
