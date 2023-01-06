import 'package:consult_in/components/constants.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:consult_in/presentation/widgets/TextFormFeildBuilder.dart';
import 'package:consult_in/sharedpref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool hide = true;
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConsultAppCubit, ConsultAppStates>(
      listener: (context, state) async {
        if (state is SuccessLoginState) {
          if (BlocProvider.of<ConsultAppCubit>(context)
                  .homeloginmodel!
                  .message ==
              "successfully login") {
            await SharedPref.setbool(key: "islogin", value: true);
            await SharedPref.setstring(
                key: "username",
                value: BlocProvider.of<ConsultAppCubit>(context)
                    .homeloginmodel!
                    .user!
                    .name!);
            gotonextpage(context, "homescreen");
            print("hii");
          }
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: const Color.fromRGBO(230, 244, 241, 1),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 5),
                        alignment: Alignment.topCenter,
                        child: const Image(
                          image: AssetImage('assets/images/iconlogin.png'),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff057c82),
                          letterSpacing: 1.0,
                        ),
                      ),
                      Text(
                        'Sign in to continue',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff324B4D),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff057c82)),
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffE6F4F1),
                      ),
                      alignment: Alignment.center,
                      child: TextFormFieldBuilder(
                        controller: emailcontroller,
                        textInputType: TextInputType.emailAddress,
                        mycursorcolor: const Color(0xff94B0B2),
                        prefixicon: const Icon(Icons.email),
                        hinttext: "enter your email",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Email should not be empty";
                          }
                          return null;
                        },
                      )),
                  Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff057c82)),
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffE6F4F1),
                      ),
                      alignment: Alignment.center,
                      child: TextFormFieldBuilder(
                        prefixicon: const Icon(
                          Icons.email,
                          color: Color(0xff057c82),
                        ),
                        controller: passwordcontroller,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "password should not be empty";
                          }
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                        hinttext: "Enter your password",
                        hide: hide,
                        suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                          icon: hide
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        mycursorcolor: const Color(0xff94B0B2),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 2, right: 20),
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xff324B4D),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xdd057c82),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<ConsultAppCubit>(context)
                              .userlogin(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text)
                              .then((value) {});
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xffE3F5EE),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Color(0xff324B4D),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          gotonextpage(context, "intro");
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff057c82),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
