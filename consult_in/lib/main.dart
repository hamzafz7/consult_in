import 'package:consult_in/components/theme.dart';
import 'package:consult_in/data/diohelper/diohelper.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/presentation/screens/auth/expert_register.dart';
import 'package:consult_in/presentation/screens/IntroRegisterScreen/intro_register.dart';
import 'package:consult_in/presentation/screens/auth/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => ConsultAppCubit()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SignupexpertScreen(),
          'home': (context) => const Homepage(),
          'intro': (context) => const IntroRegisterScreen(),
          'login': (context) => const SigninScreen(),
          'expertregister': (context) => const SignupexpertScreen(),
          'introregister': (context) => const IntroRegisterScreen()
        },
        theme: theme,
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 50,
                  color: mysecondcolor,
                  child: TextFormField(
                    showCursor: true,
                    decoration: const InputDecoration(
                        hintText: "Enter your email",
                        icon: Icon(Icons.email),
                        border: InputBorder.none),
                  )),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mycolor,
        onPressed: () {},
      ),
    );
  }
}
