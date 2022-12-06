// ignore: file_names
// ignore: file_names
import 'package:consult_in/components/constants.dart';
import 'package:consult_in/components/theme.dart';
import 'package:consult_in/presentation/screens/onboardingscreen/onboarding_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyPageViewBuilder extends StatelessWidget {
  OnBoardingModel model;
  MyPageViewBuilder({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mysecondcolor,
      child: Column(children: [
        getheigthspace(70.0),
        Image.asset(
          model.image,
          height: model.h / 1.8,
          fit: BoxFit.cover,
          width: model.w,
        ),
        getheigthspace(20.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text(model.title, style: Theme.of(context).textTheme.headline1),
        ),
        getheigthspace(10.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0, 12.0, 12.0),
          child: Center(
              child: Text(
            model.body,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.grey[500]),
          )),
        )
      ]),
    );
  }
}
