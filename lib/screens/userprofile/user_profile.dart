import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitness/api/services/api.dart';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

String? id;
String? profilename;
String? email;
String? phone;
String? imagepic;

class _UserProfileState extends State<UserProfile> {
  // @override
  // void initState() {
  //   print('nenu');
  //   profileData();
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    print('nenu vachesaaa2');
    profileData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'PROFILE',
                    style: TextStyle(
                        color: Color(0xff777777),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(right: 10, top: 10),
                child: Hero(
                  tag: 'user',
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imagepic ??
                        'https://manofmany.com/wp-content/uploads/2021/01/Fitness-Trends-2021-c.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: ExactAssetImage(
                'assets/uprofile.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    columnWid('NAME', profilename ?? 'name'),
                    const SizedBox(
                      height: 30,
                    ),
                    columnWid('EMAIL', email ?? 'email'),
                    const SizedBox(
                      height: 30,
                    ),
                    columnWid('PHONE', phone.toString()),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Icon(
                            Icons.settings,
                            color: Color(0xff777777),
                            size: 30,
                          ),
                        ),
                        Hero(
                          tag: 'set',
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed('/settings');
                            },
                            child: const Text(
                              'SETTINGS',
                              style: TextStyle(
                                  color: Color(0xff777777),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                    TextButton(
                      onPressed: () async {
                        SharedPreferences prefrences =
                            await SharedPreferences.getInstance();
                        await prefrences.clear();
                        Get.toNamed('/signIn');
                      },
                      child: const Text(
                        'LOG OUT',
                        style: TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    )
                  ],
                ),
              ),
            ],
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
          text1!,
          style: const TextStyle(
              color: Color(0xff777777),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text2!,
          style: const TextStyle(
            color: Color(0xff777777),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Future<void> profileData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id")!.toString();
    print(id);
    Map data = {'user_id': id};
    var result = await http.post(
      Uri.parse(ApiService.userprifile),
      body: data,
    );
    print(result.body);
    print(result.statusCode);

    if (result.statusCode == 200) {
      setState(() {
        profilename = json.decode(result.body)['data']['user']['name'];
        email = json.decode(result.body)['data']['user']['email'];
        phone = json.decode(result.body)['data']['user']['mobile_no'];
        imagepic = json.decode(result.body)['data']['user']['image'];
      });
    }
  }
}
