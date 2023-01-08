import 'dart:convert';
import 'package:consult_in/components/constants.dart';
import 'package:consult_in/data/diohelper/diohelper.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sharedpref/shared_pref.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<ConsultAppCubit, ConsultAppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffE6F4F1),
          appBar: buildAppBar(context),
          body: Column(
            children: [
              Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          if (userphoto != "")
                            CircleAvatar(
                              radius: 100,
                              backgroundColor: Color(0xffE6F4F1),
                              backgroundImage:
                                  MemoryImage(base64Decode(userphoto)),
                            ),
                          if (userphoto == "")
                            const CircleAvatar(
                                radius: 100,
                                backgroundColor: Color(0xffE6F4F1),
                                backgroundImage:
                                    AssetImage("assets/images/loginpic.png"))
                        ],
                      ),
                      Text(
                        username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xff057c82),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff057c82)),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff057c82),
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                        ),
                      ]),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(children: [
                      const Text(
                        '  My Wallet',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff057c82),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        '${SharedPref.getint(key: "wallet")}',
                        style: TextStyle(
                          fontSize: 19,
                          color: Color(0xff057c82),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 2, 20, 15),
              //   child: Container(
              //     height: 50,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //         border: Border.all(color: const Color(0xff057c82)),
              //         borderRadius: BorderRadius.circular(50),
              //         color: const Color(0xffE6F4F1),
              //         boxShadow: const [
              //           BoxShadow(
              //             color: Color(0xff057c82),
              //             blurRadius: 0.5,
              //             spreadRadius: 0.5,
              //           ),
              //         ]),
              //     alignment: Alignment.centerLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center, children: []),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 1, 20, 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff057c82),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {
                      logout();
                      BlocProvider.of<ConsultAppCubit>(context)
                          .logout(token: token);
                      gotonextpage(context, "login");
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Color(0xffE3F5EE),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // bottomNavigationBar: Container(
          //   color: const Color(0xffE6F4F1),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //     child: GNav(
          //       backgroundColor: const Color(0xffE6F4F1),
          //       color: const Color(0xff057c82),
          //       activeColor: const Color(0xff057c82),
          //       tabBackgroundColor: const Color(0xffE6F4F1),
          //       gap: 5,
          //       onTabChange: (indexx) {
          //         print(indexx);
          //       },
          //       padding: const EdgeInsets.all(8),
          //       tabs: const [
          //         GButton(
          //           icon: Icons.home_outlined,
          //           text: 'Home',
          //         ),
          //         GButton(
          //           icon: Icons.favorite_border_outlined,
          //           text: 'Favorites',
          //         ),
          //         GButton(
          //           icon: Icons.person_outline,
          //           text: 'Account',
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        );
      },
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: Color(0xff057c82),
      ),
      title: const Text(
        'Profile',
        style: TextStyle(
          fontSize: 24,
          color: Color(0xff057c82),
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(0xffE6F4F1),
      elevation: 0,
    );
  }

  void logout() async {
    await SharedPref.delete("islogin");
    await SharedPref.delete("userphoto");
    await SharedPref.delete("username");
    await SharedPref.delete("id");
  }
}
