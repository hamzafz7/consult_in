import 'package:consult_in/components/constants.dart';
import 'package:consult_in/components/theme.dart';
import 'package:consult_in/presentation/widgets/MaterialButtonBuilder.dart';
import 'package:consult_in/presentation/widgets/TextFormFeildBuilder.dart';
import 'package:flutter/material.dart';

class ExpertRegisterScreen extends StatefulWidget {
  const ExpertRegisterScreen({super.key});
  @override
  State<ExpertRegisterScreen> createState() => _ExpertRegisterScreenState();
}

class _ExpertRegisterScreenState extends State<ExpertRegisterScreen> {
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mysecondcolor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getheigthspace(20.0),
              /*   Container(
                height: h * 0.1,
                decoration: BoxDecoration(
                  color: mycolor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
              ),*/
              getheigthspace(h * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff057c82),
                    ),
                  ),
                  Text(
                    'As Expert',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff324B4D),
                    ),
                  ),
                ],
              ),
              getheigthspace(h * 0.04),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/loginpic.png"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: mycolor,
                    ),
                  )
                ],
              ),
              getheigthspace(h * 0.08),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff057c82)),
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffE6F4F1),
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    onSaved: (value) {},
                    cursorColor: mysecondcolor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: mycolor,
                      ),
                      hintText: "Enter your full Name",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff057c82)),
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffE6F4F1),
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    cursorColor: mysecondcolor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: mycolor,
                      ),
                      hintText: 'Email or Username',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: mycolor),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6F4F1),
                    ),
                    alignment: Alignment.center,
                    child: TextFormFieldBuilder(
                      prefixicon: Icon(
                        Icons.lock,
                        color: mycolor,
                      ),
                      mycursorcolor: mycolor,
                      hide: hide,
                      textInputType: TextInputType.visiblePassword,
                      hinttext: "password",
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                          icon: hide
                              ? Icon(
                                  Icons.visibility,
                                  color: mycolor,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: mycolor,
                                )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: h * 0.05,
                      width: w * 0.45,
                      decoration: BoxDecoration(
                          color: const Color(0xffE6F4F1),
                          border: Border.all(color: mycolor),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextFormFieldBuilder(
                          textInputType: TextInputType.phone,
                          hinttext: "phone number",
                          mycursorcolor: mycolor,
                          prefixicon: Icon(Icons.phone)),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffE6F4F1),
                          border: Border.all(color: mycolor),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: h * 0.05,
                      width: w * 0.4,
                      child: TextFormFieldBuilder(
                          textInputType: TextInputType.phone,
                          hinttext: "Address",
                          mycursorcolor: mycolor,
                          prefixicon: Icon(Icons.place_sharp)),
                    ),
                  ],
                ),
              ),
              getheigthspace(10.0),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: MaterialButtonBuilder(
                    Child: "Register",
                    height: h * 0.06,
                    onpressed: () {},
                    width: w * 0.9,
                    color: mycolor,
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: mysecondcolor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
