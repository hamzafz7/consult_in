import 'package:consult_in/components/theme.dart';
import 'package:consult_in/presentation/widgets/MaterialButtonBuilder.dart';
import 'package:consult_in/presentation/widgets/PageViewBuilder.dart';
import 'package:consult_in/sharedpref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../components/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pagecontroller = PageController();
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: mysecondcolor,
        body: Column(children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                if (value == pages.length - 1) {
                  setState(() {
                    islast = true;
                  });
                } else {
                  setState(() {
                    islast = false;
                  });
                }
              },
              physics: const BouncingScrollPhysics(),
              controller: pagecontroller,
              itemBuilder: (context, index) =>
                  MyPageViewBuilder(model: pages[index]),
              itemCount: 3,
            ),
          ),
          getheigthspace(20.0),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: SmoothPageIndicator(
                    effect: WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        dotColor: mycolor,
                        activeDotColor: mycolor,
                        paintStyle: PaintingStyle.stroke),
                    controller: pagecontroller,
                    count: pages.length),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: islast
                  ? Center(
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: MaterialButtonBuilder(
                            color: mycolor,
                            onpressed: (() async {
                              SharedPref.setbool(key: "isopened", value: true);
                              gotonextpage(context, "login");

                              //  if (islast) {
                              //        gotonextpage(context, "login");
                              // } else {
                              //    pagecontroller.nextPage(
                              //         duration:
                              //            const Duration(microseconds: 1000),
                              //      curve: Curves.fastLinearToSlowEaseIn);
                            }),
                            height: h * 0.058,
                            width: w * 0.5,
                            Child: "Get Started",
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          )),
                    )
                  : Row(
                      children: [
                        TextButton(
                          child: const Text("Skip"),
                          onPressed: () {},
                        ),
                        const Spacer(),
                        ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                            child: MaterialButtonBuilder(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                              Child: "Next",
                              height: h * 0.05,
                              width: w * 0.3,
                              onpressed: () {
                                if (islast) {
                                  gotonextpage(context, "home");
                                } else {
                                  pagecontroller.nextPage(
                                      duration:
                                          const Duration(microseconds: 1000),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                }
                              },
                              color: mycolor,
                            ))
                      ],
                    )),
        ]));
  }
}
