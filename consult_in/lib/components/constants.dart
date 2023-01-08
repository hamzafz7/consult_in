// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:consult_in/components/theme.dart';
import 'package:consult_in/presentation/screens/expertsscreen/experts_screen.dart';
import 'package:consult_in/sharedpref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import '../presentation/screens/onboardingscreen/onboarding_model.dart';

Widget getheigthspace(double h) {
  return SizedBox(
    height: h,
  );
}

Widget getwidthspace(double w) {
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
// ignore: non_constant_identifier_names
Widget CategoryItemBuilder(String img, String text, context, index) {
  return GestureDetector(
    onTap: () {
      BlocProvider.of<ConsultAppCubit>(context).getexperts(index + 1);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  ExpertsScreen(exp_type: categoriesnames[index]))));
    },
    child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
            decoration: BoxDecoration(
                color: mysecondcolor,
                border: Border.all(color: mycolor),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff057c82),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ]),
            margin: const EdgeInsets.all(4),
            height: 20,
            width: 20,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xffE6F4F1),
                    backgroundImage: AssetImage(
                      img,
                    )),
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xff057c82),
                    letterSpacing: 2,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
            ))),
  );
}

List categoriesnames = [
  "Medical",
  "Psychological",
  "Familial",
  "Business",
  "Vocational"
];
List catrgoriesphotos = [
  "assets/images/medicall.png",
  'assets/images/psychological.png',
  'assets/images/familial.png',
  'assets/images/business1.png',
  'assets/images/vocational.png'
];
List categories_id = [1, 2, 3, 4, 5];
String username = SharedPref.getstring(key: "username") ?? "";
String userphoto = SharedPref.getstring(key: "userphoto") ?? "";
String userrole = SharedPref.getstring(key: "userrole") ?? "";
String token = SharedPref.getstring(key: "token") ?? "";
int role = SharedPref.getint(key: "role") ?? -1;
int id = SharedPref.getint(key: "id") ?? -1;
int wallet = SharedPref.getint(key: "wallet") ?? -1;
