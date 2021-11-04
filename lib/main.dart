import 'package:fitness/screens/dashboard/main_dashboard.dart';
import 'package:fitness/screens/logins/sign_in.dart';
import 'package:fitness/screens/logins/sign_up.dart';
import 'package:fitness/screens/logins/welcome.dart';
import 'package:fitness/screens/splash.dart';
import 'package:fitness/screens/userprofile/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'screens/userprofile/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitness',
        darkTheme: ThemeData(
            hintColor: Colors.grey[850],
            fontFamily: 'Montserrat',
            primaryColor: Colors.black),
        theme: ThemeData(
          hintColor: Colors.grey[850],
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
        ),
        home: const Splash(),
        routes: {
          '/signIn': (context) => const SignIn(),
          '/signUp': (context) => const SignUp(),
          '/welcome': (context) => const WelcomeScreen(),
          '/userprofile': (context) => const UserProfile(),
          '/settings': (context) => const Settings(),
          '/mainDash': (context) => const MainDashBoard(),
        },
      ),
    );
  }
}
