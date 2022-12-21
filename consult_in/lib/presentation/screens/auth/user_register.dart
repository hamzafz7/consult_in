import 'package:consult_in/presentation/screens/auth/expert_register.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6F4F1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff057c82)),
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffE6F4F1),
                ),
                alignment: Alignment.center,
                child: TextField(
                  onSubmitted: (value) {
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
                      Icons.call,
                      color: Color(0xff057c82),
                    ),
                    hintText: 'phone number',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xdd057c82),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupexpertScreen(),
                        ),
                      );
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
                    onPressed: () {
                      Navigator.pop(context);
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
      ),
    );
  }
}
