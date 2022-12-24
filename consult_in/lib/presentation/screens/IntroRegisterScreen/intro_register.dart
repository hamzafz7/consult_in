import 'package:consult_in/components/constants.dart';
import 'package:consult_in/components/theme.dart';
import 'package:consult_in/presentation/widgets/MaterialButtonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IntroRegisterScreen extends StatelessWidget {
  IntroRegisterScreen({super.key});
  var h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mysecondcolor,
      body: Column(children: [
        getheigthspace(h * 0.11),
        Image.asset(
          "assets/images/welcome.png",
          height: h / 2,
          width: w,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
            TyperAnimatedText("Welcome !",
                textStyle: Theme.of(context).textTheme.headline2,
                speed: const Duration(milliseconds: 100)),
            TyperAnimatedText("WE are Happy to have you",
                textStyle: Theme.of(context).textTheme.headline2,
                speed: const Duration(milliseconds: 100)),
            TyperAnimatedText("How would you like to Register ?",
                textStyle: Theme.of(context).textTheme.headline2,
                speed: const Duration(milliseconds: 100)),
          ]),
        ),
        getheigthspace(h * 0.07),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: MaterialButtonBuilder(
              Child: "As Expert",
              height: h * 0.06,
              onpressed: () {
                gotonextpage(context, "expertregister");
              },
              width: w * 0.8,
              color: mycolor,
              textStyle: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white)),
        ),
        getheigthspace(h * 0.01),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: MaterialButtonBuilder(
              Child: "As User",
              height: h * 0.06,
              onpressed: () {
                gotonextpage(context, "userregister");
              },
              width: w * 0.8,
              color: mycolor,
              textStyle: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white)),
        )
      ]),
    );
  }
}
