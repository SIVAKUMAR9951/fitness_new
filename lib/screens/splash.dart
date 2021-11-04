import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? id;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? authToken;
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    onIntroEnd(context);
    Get.toNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: AssetImage('assets/cd_logo.png'))),
    );
  }

  onIntroEnd(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString('id');
    if (id == null || id!.isEmpty) {
      Get.toNamed('/welcome');
    } else {
      Get.toNamed('/mainDash');
    }
  }
}
