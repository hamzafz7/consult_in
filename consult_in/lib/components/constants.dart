// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

import '../presentation/screens/onboardingscreen/onboarding_model.dart';

Widget getheigthspace(h) {
  return SizedBox(
    height: h,
  );
}

Widget getwidthspace(w) {
  return SizedBox(
    width: w,
  );
}

gotonextpage(context, String name) {
  Navigator.pushReplacementNamed(context, name);
}

var h, w;
List<OnBoardingModel> pages = [
  OnBoardingModel(
      h: h,
      w: w,
      image: "assets/images/first.png",
      title: "Best Consultants",
      body:
          "A comprehensive Network of highly qualified Specialists and Consultants"),
  OnBoardingModel(
      h: h,
      w: w,
      image: "assets/images/second.png",
      title: "Instant Sessions",
      body:
          "Various sessions according to the case , the specialist and the appropiate timing"),
  OnBoardingModel(
      h: h,
      w: w,
      image: "assets/images/third.png",
      title: "Complete privacy",
      body:
          "Consult-in assures that no one can see the existing conversations between the specialist and the user"),
];
