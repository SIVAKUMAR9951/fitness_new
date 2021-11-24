import 'package:fitness/bpm/hear_main.dart';
import 'package:fitness/controller/catagories_controller.dart';
import 'package:fitness/screens/calender/calender.dart';
import 'package:fitness/screens/membership/membership.dart';
import 'package:fitness/screens/plans.dart';

import 'package:fitness/screens/qr/qr.dart';
import 'package:fitness/screens/mobility/mobility.dart';
import 'package:fitness/screens/notifications/notify.dart';
import 'package:fitness/screens/pt/personaltrainer.dart';
import 'package:fitness/screens/userprofile/user_profile.dart';
import 'package:fitness/screens/wod/wod.dart';

import 'package:fitness/screens/wod/wod_detail.dart';
import 'package:fitness/screens/wod/wod_detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  var catController = Get.put(CategoriesController);

  String? id;

  @override
  void initState() {
    Get.put(CategoriesController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Get.put(CategoriesController()).postloading.value
              ? Center(
                  child: Image.network(
                      'https://cdn.dribbble.com/users/26878/screenshots/3544693/07-loader.gif'),
                )
              : Get.put(CategoriesController()).getCats.isEmpty
                  ? const Center(
                      child: Text(
                        "No Data Found..",
                      ),
                    )
                  : Column(children: [
                      Container(
                        color: Colors.white12,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    Get.put(CategoriesController())
                                        .getCats[0]
                                        .username
                                        .toString(),
                                    style: const TextStyle(
                                        color: Color(0xff777777),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ClipRRect(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        'assets/signin_logo.png',
                                        width: 120,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 680,
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
                                      tag: 'wod',
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
                                              borderRadius:
                                                  BorderRadius.circular(1.0),
                                              child: Image.network(
                                                Get.put(CategoriesController())
                                                    .getCats[0]
                                                    .image
                                                    .toString(),
                                                fit: BoxFit.scaleDown,
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
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => HeartBpm());
                                    },
                                    child: Hero(
                                      tag: 'bpm',
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
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                child: Image.network(
                                                  Get.put(CategoriesController())
                                                      .getCats[6]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'BPM',
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
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                child: Image.network(
                                                  Get.put(CategoriesController())
                                                      .getCats[8]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.scaleDown,
                                                ),
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
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                child: Image.network(
                                                  Get.put(CategoriesController())
                                                      .getCats[7]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.scaleDown,
                                                ),
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
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                child: Image.network(
                                                  Get.put(CategoriesController())
                                                      .getCats[1]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.scaleDown,
                                                ),
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
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                child: Image.network(
                                                  Get.put(CategoriesController())
                                                      .getCats[3]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.scaleDown,
                                                ),
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
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => const Membership());
                                    },
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
                                              borderRadius:
                                                  BorderRadius.circular(1.0),
                                              child: Image.network(
                                                Get.put(CategoriesController())
                                                    .getCats[4]
                                                    .image
                                                    .toString(),
                                                fit: BoxFit.scaleDown,
                                              ),
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
                                ),
                                Positioned(
                                  top: 280,
                                  width: 200,
                                  height: 150,
                                  left: 200,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => const Plans());
                                    },
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
                                              borderRadius:
                                                  BorderRadius.circular(1.0),
                                              child: Image.network(
                                                Get.put(CategoriesController())
                                                    .getCats[5]
                                                    .image
                                                    .toString(),
                                                fit: BoxFit.scaleDown,
                                              ),
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
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                child: Image.network(
                                                  Get.put(CategoriesController())
                                                      .getCats[9]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.scaleDown,
                                                ),
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
                                  width: 250,
                                  height: 200,
                                  left: 150,
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
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                child: Image.network(
                                                  Get.put(CategoriesController())
                                                      .getCats[10]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'NOTIFICATIONS',
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
                    ]);
        }),
      ),
    );
  }

  // Future<void> dashBoardData() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   id = pref.getString("id")!.toString();
  //   print(id);
  //   Map data = {
  //     'user_id': id,
  //   };
  //   var result = await http.post(
  //     Uri.parse(ApiService.dashBoard),
  //     body: data,
  //   );
  //   print(result.body);
  //   print(result.statusCode);

  //   if (result.statusCode == 200) {
  //     setState(() {
  //       catName = json.decode(result.body)['data']['categories'][0]['name'];
  //       catImage1 = json.decode(result.body)['data']['categories'][0]['image'];
  //       catImage2 = json.decode(result.body)['data']['categories'][1]['image'];
  //       catImage3 = json.decode(result.body)['data']['categories'][2]['image'];
  //       catImage4 = json.decode(result.body)['data']['categories'][3]['image'];
  //       catImage5 = json.decode(result.body)['data']['categories'][4]['image'];
  //       catImage6 = json.decode(result.body)['data']['categories'][5]['image'];
  //       catImage7 = json.decode(result.body)['data']['categories'][6]['image'];
  //       catImage8 = json.decode(result.body)['data']['categories'][7]['image'];
  //       catImage9 = json.decode(result.body)['data']['categories'][8]['image'];
  //       catImage10 = json.decode(result.body)['data']['categories'][9]['image'];
  //       catImage11 =
  //           json.decode(result.body)['data']['categories'][10]['image'];
  //     });
  //     print(catImage3);
  //   }
  // }
}
