import 'dart:convert';
import 'dart:io';
import 'package:consult_in/components/constants.dart';
import 'package:consult_in/components/theme.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:consult_in/presentation/widgets/TextFormFeildBuilder.dart';
import 'package:consult_in/sharedpref/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignupexpertScreen extends StatefulWidget {
  const SignupexpertScreen({Key? key}) : super(key: key);

  @override
  State<SignupexpertScreen> createState() => _SignupexpertScreenState();
}

class _SignupexpertScreenState extends State<SignupexpertScreen> {
  bool hide = true;
  List<String> items = [
    'The consult type you provide',
    'Medical',
    'Vocational',
    'Psychological',
    'Familial',
    'Business'
  ];
  String? selectedItem = 'The consult type you provide';
  File? path;
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var expercontroller = TextEditingController();
  var costcontroller = TextEditingController();

  int id = 0;
  var formkey = GlobalKey<FormState>();

  Future imagepick(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? path1 = File(image.path);
    setState(() {
      path = path1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConsultAppCubit, ConsultAppStates>(
        listener: (context, state) async {
      if (state is SuccessExpertRegisterState) {
        if (BlocProvider.of<ConsultAppCubit>(context).homeloginmodel!.message ==
            "User successfully registered") {
          await SharedPref.setbool(key: "islogin", value: true);
          if (BlocProvider.of<ConsultAppCubit>(context).homeloginmodel !=
              null) {
            await SharedPref.setstring(
                key: "username",
                value: BlocProvider.of<ConsultAppCubit>(context)
                    .homeloginmodel!
                    .user!
                    .name!);
            await SharedPref.setstring(
                key: "userphoto",
                value: BlocProvider.of<ConsultAppCubit>(context)
                    .homeloginmodel!
                    .user!
                    .photo_path!);
            await SharedPref.setstring(
                key: "token",
                value: BlocProvider.of<ConsultAppCubit>(context)
                    .homeloginmodel!
                    .access_token!);
            await SharedPref.setint(
                key: "role",
                value: BlocProvider.of<ConsultAppCubit>(context)
                    .homeloginmodel!
                    .user!
                    .role!);
            await SharedPref.setint(
                key: "id",
                value: BlocProvider.of<ConsultAppCubit>(context)
                    .homeloginmodel!
                    .user!
                    .id!);
            await SharedPref.setint(key: "wallet", value: 3000);
          }

          gotonextpage(context, "homescreen");
        }
      }
    }, builder: ((context, state) {
      return Scaffold(
          backgroundColor: mysecondcolor,
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            path == null
                                ? const CircleAvatar(
                                    radius: 80,
                                    backgroundImage: AssetImage(
                                        "assets/images/loginpic.png"),
                                  )
                                : CircleAvatar(
                                    radius: 80,
                                    backgroundImage: FileImage(path!),
                                  ),
                            IconButton(
                              onPressed: () {
                                imagepick(ImageSource.gallery);
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Color(0xff057c82),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff057c82),
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff057c82)),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                    ),
                    alignment: Alignment.center,
                    child: TextFormFieldBuilder(
                      controller: namecontroller,
                      textInputType: TextInputType.name,
                      mycursorcolor: const Color(0xff94B0B2),
                      prefixicon: Icon(
                        Icons.person,
                        color: mycolor,
                      ),
                      hinttext: 'Full Name',
                      validate: (value) {
                        if (value!.isEmpty) return " should not be empty";
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
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
                      prefixicon: Icon(
                        Icons.email,
                        color: mycolor,
                      ),
                      hinttext: 'Email Address',
                      validate: (value) {
                        if (value!.isEmpty) return "should not be empty";
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff057c82)),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                    ),
                    alignment: Alignment.center,
                    child: TextFormFieldBuilder(
                      validate: (value) {
                        if (value!.isEmpty) return "should not be empty";
                        return null;
                      },
                      controller: passwordcontroller,
                      hide: hide,
                      textInputType: TextInputType.visiblePassword,
                      mycursorcolor: const Color(0xff94B0B2),
                      prefixicon: const Icon(
                        Icons.lock,
                        color: Color(0xff057c82),
                      ),
                      hinttext: 'Password',
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
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff057c82)),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                    ),
                    alignment: Alignment.center,
                    child: TextFormFieldBuilder(
                      controller: phonecontroller,
                      textInputType: TextInputType.phone,
                      mycursorcolor: const Color(0xff94B0B2),
                      prefixicon: const Icon(
                        Icons.phone,
                        color: Color(0xff057c82),
                      ),
                      hinttext: 'phone number',
                      validate: (value) {
                        if (value!.isEmpty) return "should not be empty";
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff057c82)),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                    ),
                    alignment: Alignment.center,
                    child: TextFormFieldBuilder(
                      controller: addresscontroller,
                      textInputType: TextInputType.streetAddress,
                      mycursorcolor: const Color(0xff94B0B2),
                      prefixicon: const Icon(
                        Icons.place,
                        color: Color(0xff057c82),
                      ),
                      hinttext: 'Address',
                      validate: (value) {
                        if (value!.isEmpty) return "should not be empty";
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff057c82)),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                    ),
                    alignment: Alignment.center,
                    child: DropdownButtonFormField<String>(
                      hint: const Text(
                        'The consult type you provide',
                        style: TextStyle(
                          color: Color(0xff94B0B2),
                        ),
                      ),
                      value: selectedItem,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedItem = newValue;
                          if (selectedItem == "Medical") id = 1;
                          if (selectedItem == "Business") id = 2;
                          if (selectedItem == "Vocational") id = 3;
                          if (selectedItem == "Psychological") id = 5;
                          if (selectedItem == "Familial") id = 4;
                        });
                        print(id);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff057c82)),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                    ),
                    alignment: Alignment.center,
                    child: TextFormFieldBuilder(
                      textInputType: TextInputType.text,
                      controller: expercontroller,
                      mycursorcolor: const Color(0xff94B0B2),
                      prefixicon: const Icon(
                        Icons.star_outline_sharp,
                        color: Color(0xff057c82),
                      ),
                      hinttext: 'Your experience',
                      validate: (value) {
                        if (value!.isEmpty) return "should not be empty";
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff057c82)),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                    ),
                    alignment: Alignment.center,
                    child: TextFormFieldBuilder(
                      textInputType: TextInputType.text,
                      controller: costcontroller,
                      mycursorcolor: const Color(0xff94B0B2),
                      prefixicon: const Icon(
                        Icons.money,
                        color: Color(0xff057c82),
                      ),
                      hinttext: 'Your cost',
                      validate: (value) {
                        if (value!.isEmpty) return "should not be empty";
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xdd057c82),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: MaterialButton(
                        onPressed: () async {
                          var imgname = path!.path.split('/').last;
                          FormData data = FormData.fromMap({
                            "photo": await MultipartFile.fromFile(
                              path!.path,
                              filename: imgname,
                            )
                          });
                          BlocProvider.of<ConsultAppCubit>(context)
                              .expertregister(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                  name: namecontroller.text,
                                  phone: phonecontroller.text,
                                  address: addresscontroller.text,
                                  experience: expercontroller.text,
                                  id: id,
                                  cost: costcontroller.text,
                                  data: data);
                        },
                        child: const Text(
                          'Sign up as expert',
                          style: TextStyle(
                            color: Color(0xffE3F5EE),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  const SizedBox(height: 1),
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
                        onPressed: () {
                          gotonextpage(context, "login");
                        },
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
          )));
    }));
  }
}
