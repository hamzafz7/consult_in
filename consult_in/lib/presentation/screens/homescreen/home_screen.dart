import 'package:consult_in/components/constants.dart';
import 'package:consult_in/components/theme.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final conrtoller = ScrollController();
  int index = 0;
  var h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.height;
    print(userphoto);
    print(userrole);
    return BlocConsumer<ConsultAppCubit, ConsultAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: mysecondcolor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: mysecondcolor,
            title: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      setphoto(),
                      getwidthspace(10.0),
                      Text(
                        "HI, $username",
                        style: const TextStyle(
                          color: Color(0xff057c82),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 15.0),
                child: Icon(
                  Icons.settings,
                  color: Color(0xff057c82),
                  size: 30,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(children: [
                Stack(children: [
                  Container(
                    width: w,
                    height: h * 0.13,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff057c82),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffDDEFE9), shape: BoxShape.circle),
                          child: Icon(
                            Icons.star,
                            color: Color(0xff057c82),
                            size: 15,
                          ),
                        ),
                        getwidthspace(15.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'All Specialists in one app',
                              style: TextStyle(
                                color: Color(0xffE6F4F1),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            getheigthspace(5.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  'Find your consultant\nand make an appointment with one tap !',
                                  style: TextStyle(
                                    color: Color(0xffE6F4F1),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 1,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffE6F4F1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xff057c82),
                            blurRadius: 6,
                            spreadRadius: 3,
                          ),
                        ]),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search ...',
                        hintStyle: TextStyle(
                          color: Color(0xff94B0B2),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                          color: Color(0xff94B0B2),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: Text(
                    'Consulting types',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xff057c82),
                      fontSize: 26.0,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      child: GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                              5,
                              ((index) => CategoryItemBuilder(
                                  catrgoriesphotos[index],
                                  categoriesnames[index]))))),
                )
              ]),
            ),
          ),
          bottomNavigationBar: Container(
            color: const Color(0xffE6F4F1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GNav(
                backgroundColor: const Color(0xffE6F4F1),
                color: const Color(0xff057c82),
                activeColor: const Color(0xff057c82),
                tabBackgroundColor: const Color(0xffE6F4F1),
                gap: 5,
                onTabChange: (indexx) {
                  print(indexx);
                },
                padding: const EdgeInsets.all(8),
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.favorite_border_outlined,
                    text: 'Favorites',
                  ),
                  GButton(
                    icon: Icons.person_outline,
                    text: 'Account',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget setphoto() {
  if (userphoto != "") {
    return CircleAvatar(
      backgroundImage: MemoryImage(base64Decode(userphoto)),
    );
  }

  return Image.asset("assets/images/loginpic.png");
}
