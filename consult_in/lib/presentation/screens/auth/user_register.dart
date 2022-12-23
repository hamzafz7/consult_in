import 'package:consult_in/components/theme.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:consult_in/presentation/screens/auth/expert_register.dart';
import 'package:consult_in/presentation/widgets/TextFormFeildBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConsultAppCubit, ConsultAppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffE6F4F1),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: const Image(
                              image: AssetImage('assets/images/iconsignup.png'),
                            ),
                          ),
                        ),
                        const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff057c82),
                            letterSpacing: 1.0,
                          ),
                        ),
                        const Text(
                          'create new account',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff324B4D),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff057c82)),
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffE6F4F1),
                      ),
                      alignment: Alignment.center,
                      child: TextFormFieldBuilder(
                        textInputType: TextInputType.name,
                        validate: ((value) {
                          if (value == null) {
                            return " must insert your name";
                          }
                          return null;
                        }),
                        controller: namecontroller,
                        mycursorcolor: const Color(0xff94B0B2),
                        prefixicon: Icon(
                          Icons.person,
                          color: mycolor,
                        ),
                        hinttext: 'Full Name',
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
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
                        validate: ((value) {
                          if (value == null) {
                            return " must insert your email";
                          }
                          return null;
                        }),
                        mycursorcolor: const Color(0xff94B0B2),
                        hinttext: 'Email Address',
                        prefixicon: Icon(
                          Icons.email,
                          color: mycolor,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff057c82)),
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffE6F4F1),
                      ),
                      alignment: Alignment.center,
                      child: TextFormFieldBuilder(
                        controller: passwordcontroller,
                        validate: ((value) {
                          if (value == null) {
                            return " must insert your password";
                          }
                          return null;
                        }),
                        hinttext: "Passowrd",
                        hide: hide,
                        textInputType: TextInputType.visiblePassword,
                        mycursorcolor: const Color(0xff94B0B2),
                        prefixicon: Icon(Icons.lock, color: mycolor),
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
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff057c82)),
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffE6F4F1),
                      ),
                      alignment: Alignment.center,
                      child: TextFormFieldBuilder(
                        controller: phonecontroller,
                        validate: ((value) {
                          if (value == null) {
                            return " must insert your phone";
                          }
                          return null;
                        }),
                        textInputType: TextInputType.phone,
                        mycursorcolor: const Color(0xff94B0B2),
                        prefixicon: Icon(
                          Icons.call,
                          color: mycolor,
                        ),
                        hinttext: 'phone number',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 50),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color(0xdd057c82),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: () {
                            BlocProvider.of<ConsultAppCubit>(context)
                                .userRegister(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                    name: namecontroller.text,
                                    phone: phonecontroller.text);
                          },
                          child: const Text(
                            'Sign Up as user',
                            style: TextStyle(
                              color: Color(0xffE3F5EE),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already Registered?',
                          style: TextStyle(
                            color: Color(0xff324B4D),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Log in here',
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
        );
      },
    );
  }
}
