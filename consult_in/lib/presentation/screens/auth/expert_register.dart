import 'dart:io';

import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xffE6F4F1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
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
                                backgroundImage:
                                    AssetImage("assets/images/loginpic.png"),
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
                child: TextField(
                  keyboardType: TextInputType.name,
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print(value);
                  },
                  cursorColor: const Color(0xff94B0B2),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xff057c82),
                    ),
                    hintText: 'Full Name',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
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
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print(value);
                  },
                  cursorColor: const Color(0xff94B0B2),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xff057c82),
                    ),
                    hintText: 'Email Address',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
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
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print(value);
                  },
                  cursorColor: const Color(0xff94B0B2),
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock,
                      color: Color(0xff057c82),
                    ),
                    hintText: 'Password',
                    suffixIcon: IconButton(
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
                child: TextField(
                  keyboardType: TextInputType.phone,
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print(value);
                  },
                  cursorColor: const Color(0xff94B0B2),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xff057c82),
                    ),
                    hintText: 'phone number',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
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
                child: TextField(
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print(value);
                  },
                  cursorColor: const Color(0xff94B0B2),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.place,
                      color: Color(0xff057c82),
                    ),
                    hintText: 'Address',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
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
                    });
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
                child: TextField(
                  onSubmitted: (value) {
                    // ignore: avoid_print
                    print(value);
                  },
                  cursorColor: const Color(0xff94B0B2),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.star_outline_sharp,
                      color: Color(0xff057c82),
                    ),
                    hintText: 'Your experience',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xdd057c82),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign up as expert',
                      style: TextStyle(
                        color: Color(0xffE3F5EE),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
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
    );
  }
}
