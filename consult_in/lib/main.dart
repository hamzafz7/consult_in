import 'package:consult_in/components/theme.dart';
import 'package:consult_in/data/diohelper/diohelper.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/presentation/screens/auth/expert_register.dart';
import 'package:consult_in/presentation/screens/IntroRegisterScreen/intro_register.dart';
import 'package:consult_in/presentation/screens/auth/log_in.dart';
import 'package:consult_in/presentation/screens/auth/user_register.dart';
import 'package:consult_in/presentation/screens/homescreen/home_screen.dart';
import 'package:consult_in/presentation/screens/splashscreen/splash_screen.dart';
import 'package:consult_in/sharedpref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool isopened = false, islogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  SharedPref.setbool(key: "islogin", value: false);
  isopened = SharedPref.getbool(key: "isopened") ?? false;
  islogin = SharedPref.getbool(key: "islogin") ?? false;
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
          '/': (context) => SplashScreen(
                islogin: islogin,
                isopen: isopened,
              ),
          "homescreen": (context) => HomeScreen(),
          " ": ((context) => SignupScreen()),
          'intro': (context) => IntroRegisterScreen(),
          'login': (context) => const SigninScreen(),
          'expertregister': (context) => const SignupexpertScreen(),
        },
        theme: theme,
      ),
    );
  }
}
