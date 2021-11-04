import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

bool isSwitched1 = false;
bool isSwitched2 = false;
bool isSwitched3 = false;
bool isSwitched4 = false;
bool isSwitched5 = false;

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Hero(
                  tag: 'notify',
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'NOTIFICATIONS',
                      style: TextStyle(
                          color: Color(0xff777777),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: ExactAssetImage(
                'assets/wl.png',
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '    PUSH NOTIFICATIONS',
                      style: TextStyle(
                          color: Color(0xff777777),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              columnWid('MESSAGES', 'FROM FRIENDS'),
                              Switch(
                                value: isSwitched1,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched1 = value;
                                  });
                                },
                                activeTrackColor: const Color(0xff777777),
                                activeColor: const Color(0xFFF00000),
                              ),
                            ]),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              columnWid('ACCOUNT ACTIVITY',
                                  'CHANGES MADE TO YOUR ACTIVITY'),
                              Switch(
                                value: isSwitched2,
                                onChanged: (value1) {
                                  setState(() {
                                    isSwitched2 = value1;
                                  });
                                },
                                activeTrackColor: const Color(0xff777777),
                                activeColor: const Color(0xFFF00000),
                              ),
                            ]),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              columnWid('PRODUCT ANNOUCEMENT',
                                  'FEATURES UPDATES AND MORE'),
                              Switch(
                                value: isSwitched3,
                                onChanged: (value1) {
                                  setState(() {
                                    isSwitched3 = value1;
                                  });
                                },
                                activeTrackColor: const Color(0xff777777),
                                activeColor: const Color(0xFFF00000),
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '    TEXT MESSAGES NOTIFICATIONS',
                          style: TextStyle(
                              color: Color(0xff777777),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              columnWid('MESSAGES', 'FROM FRIENDS'),
                              Switch(
                                value: isSwitched4,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched4 = value;
                                  });
                                },
                                activeTrackColor: const Color(0xff777777),
                                activeColor: const Color(0xFFF00000),
                              ),
                            ]),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              columnWid('ACCOUNT ACTIVITY',
                                  'CHANGES MADE TO YOUR ACTIVITY'),
                              Switch(
                                value: isSwitched5,
                                onChanged: (value1) {
                                  setState(() {
                                    isSwitched5 = value1;
                                  });
                                },
                                activeTrackColor: const Color(0xff777777),
                                activeColor: const Color(0xFFF00000),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column columnWid(text1, text2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
              color: Color(0xff777777),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text2,
          style: const TextStyle(
            color: Color(0xff777777),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
