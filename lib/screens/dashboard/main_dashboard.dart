import 'package:fitness/screens/calender/calender.dart';
import 'package:fitness/screens/qr/qr.dart';
import 'package:fitness/screens/mobility/mobility.dart';
import 'package:fitness/screens/notifications/notify.dart';
import 'package:fitness/screens/pt/personaltrainer.dart';
import 'package:fitness/screens/userprofile/user_profile.dart';
import 'package:fitness/screens/wod/wod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDashBoard extends StatelessWidget {
  const MainDashBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Icon(
                        Icons.home,
                        color: Color(0xff777777),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'JOHN',
                        style: TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/signin_logo.png',
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 750,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                'assets/cd_logo.png',
              ),
            )),
            child: ListView(children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 530,
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      left: 5,
                      height: 150,
                      width: 250,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const Wod());
                        },
                        child: Hero(
                          tag: 'hero',
                          child: Card(
                            color: Colors.white70,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1.0),
                              ),
                            ),
                            elevation: 5,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(1.0),
                                  child: Image.asset(
                                    'assets/hd/1.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  'WOD',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 180,
                      width: 200,
                      height: 150,
                      child: Card(
                        color: Colors.white54,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(1.0),
                          ),
                        ),
                        elevation: 10,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1.0),
                                child: Image.asset('assets/hd/2.jpg',
                                    fit: BoxFit.contain),
                              ),
                            ),
                            const Text(
                              'Camera',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 185,
                      left: 10,
                      width: 350,
                      height: 180,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const QRCode());
                        },
                        child: Hero(
                          tag: 'qr',
                          child: Card(
                            color: Colors.white54,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1.0),
                              ),
                            ),
                            elevation: 10,
                            child: Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1.0),
                                    child: Image.asset('assets/qr.png',
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const Text(
                                  'QR CODE',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 360,
                      left: 100,
                      width: 200,
                      height: 150,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => CalendarScreen());
                        },
                        child: Hero(
                          tag: 'cal',
                          child: Card(
                            color: Colors.white54,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1.0),
                              ),
                            ),
                            elevation: 10,
                            child: Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1.0),
                                    child: Image.asset('assets/hd/cal.png',
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const Text(
                                  'CALENDER',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 860,
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      height: 200,
                      width: 350,
                      child: InkWell(
                        onTap: () {
                          Get.to(const Mobility());
                        },
                        child: Hero(
                          tag: 'Mobility',
                          child: Card(
                            color: Colors.white54,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1.0),
                              ),
                            ),
                            elevation: 10,
                            child: Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1.0),
                                    child: Image.asset('assets/hd/5.jpg',
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const Text(
                                  'MOBILITY',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      left: 120,
                      width: 250,
                      height: 150,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const UserProfile());
                        },
                        child: Hero(
                          tag: 'user',
                          child: Card(
                            color: Colors.white54,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1.0),
                              ),
                            ),
                            elevation: 10,
                            child: Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1.0),
                                    child: Image.asset('assets/hd/11.jpg',
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const Text(
                                  'PROFILE',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 280,
                      width: 200,
                      height: 150,
                      child: Card(
                        color: Colors.white54,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(1.0),
                          ),
                        ),
                        elevation: 10,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1.0),
                                child: Image.asset('assets/hd/6.jpg',
                                    fit: BoxFit.contain),
                              ),
                            ),
                            const Text(
                              'MEMBERSHIP',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 280,
                      width: 200,
                      height: 150,
                      left: 200,
                      child: Card(
                        color: Colors.white54,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(1.0),
                          ),
                        ),
                        elevation: 10,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1.0),
                                child: Image.asset('assets/hd/7.jpg',
                                    fit: BoxFit.contain),
                              ),
                            ),
                            const Text(
                              'PLANS',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 450,
                      width: 300,
                      height: 250,
                      child: InkWell(
                        onTap: () {
                          Get.to(const PersonalTrainer());
                        },
                        child: Hero(
                          tag: 'pt',
                          child: Card(
                            color: Colors.white54,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1.0),
                              ),
                            ),
                            elevation: 10,
                            child: Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1.0),
                                    child: Image.asset('assets/hd/14.jpg',
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const Text(
                                  'PERSONAL TRAINER',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 550,
                      width: 200,
                      height: 250,
                      left: 200,
                      child: InkWell(
                        onTap: () {
                          Get.to(const Notifications());
                        },
                        child: Hero(
                          tag: 'notify',
                          child: Card(
                            color: Colors.white54,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1.0),
                              ),
                            ),
                            elevation: 10,
                            child: Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1.0),
                                    child: Image.asset('assets/hd/16.jpg',
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const Text(
                                  'NOTIFIC\nATIONS',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
