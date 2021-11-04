import 'dart:convert';

import 'package:fitness/api/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

String? id;

String? profilename;

String? dob;

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  String? dropdownvalue, dropdownvalue1, dropdownvalue2;
  var items = ['ENGLISH', 'HINDI', 'SPANISH'];
  var country = ['INDIA', 'UAE', 'USA'];
  var gender = ['MALE', 'FEMALE'];

  @override
  void initState() {
    settingData();
    super.initState();
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
                  child: Hero(
                    tag: 'set',
                    child: Text(
                      'SETTINGS',
                      style: TextStyle(
                          color: Color(0xff777777),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.settings,
                  color: Color(0xff777777),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      columnWid('NAME', profilename ?? 'name'),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          columnWid('DOB', dob.toString()),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset('assets/Planner.png'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          columnWid('GENDER', 'SELECT YOUR GENDER'),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                icon: Image.asset('assets/pdown.png'),
                                dropdownColor: const Color(0xFFC7C7C7),
                                value: dropdownvalue1,
                                items: gender.map((String items) {
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff777777)),
                                      ));
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue1 = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          columnWid('COUNTRY & STATE',
                              'SELECT YOUR COUNTRY \n& STATE'),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                icon: Image.asset('assets/pdown.png'),
                                dropdownColor: const Color(0xFFC7C7C7),
                                value: dropdownvalue2,
                                items: country.map((String items) {
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff777777)),
                                      ));
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue2 = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          columnWid('LANGUAGE', 'SELECT LANGUAGE'),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: const Color(0xFFC7C7C7),
                                icon: Image.asset('assets/pdown.png'),
                                value: dropdownvalue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff777777)),
                                      ));
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'NOTIFICATIONS',
                            style: TextStyle(
                                color: Color(0xff777777),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeTrackColor: const Color(0xff777777),
                            activeColor: const Color(0xFFF00000),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'LEGAL',
                        style: TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const Text(
                        '\n  TERMS & CONDITIONS',
                        style: TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const Text(
                        '\n  PRIVACY POLICY',
                        style: TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
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

  Future<void> settingData() async {
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
        dob = json.decode(result.body)['data']['user']['dob'];
        print(dob);
      });
      // phone = json.decode(result.body)['data']['user']['mobile_no'];
      // imagepic = json.decode(result.body)['data']['user']['image'];
    }
  }
}
