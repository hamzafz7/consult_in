import 'package:consult_in/components/constants.dart';
import 'package:consult_in/components/theme.dart';
import 'package:consult_in/presentation/widgets/TextFormFeildBuilder.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mysecondcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * 0.32,
              decoration: BoxDecoration(
                color: mycolor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/loginpic.png",
                    width: w * 0.5,
                    height: h * 0.3,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff057c82),
                  ),
                ),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff324B4D),
                  ),
                ),
              ],
            ),
            getheigthspace(h * 0.15),
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
            Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
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
                onTap: () => {},
              ),
            ),
            GestureDetector(
              onTap: () => {},
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  color: mycolor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text('LOGIN',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: const Color(0xffE3F5EE))),
                ),
              ),
            ),
            getheigthspace(5.0),
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
                    gotonextpage(context, "introregister");
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
    );
  }
}
