// import 'dart:html';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fitness/api/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SingingCharacter { arnold, hruthik, john, sharukh }

class PersonalTrainer extends StatefulWidget {
  const PersonalTrainer({Key? key}) : super(key: key);

  @override
  State<PersonalTrainer> createState() => _PersonalTrainerState();
}

String? id;
String? ptName;

class _PersonalTrainerState extends State<PersonalTrainer> {
  SingingCharacter? _character = SingingCharacter.arnold;

  @override
  void initState() {
    personalTrainerData();
    super.initState();
  }

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
                  tag: 'pt',
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'PERSONAL TRAINER',
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
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) => Card(
            elevation: 5,
            // color: Colors.grey[200],
            child: ListTile(
              tileColor: Colors.grey[300],
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/hd/11.jpg'),
              ),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    columnWid('ARNOLD', 'FitnessSpecialist'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('30days/50\$'),
                  ]),
              trailing: Radio<SingingCharacter>(
                value: SingingCharacter.arnold,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
          itemCount: 50,
        ),
      ),
    );
  }

  Column columnWid(text1, text2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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

  Future<void> personalTrainerData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id")!.toString();
    print(id);
    Map data = {'user_id': id, 'trainer_id': '3', 'membership_id': '1'};
    var result = await http.post(
      Uri.parse(ApiService.personalTrainer),
      body: data,
    );
    print(result.body);
    print(result.statusCode);

    if (result.statusCode == 200) {
      ptName = json.decode(result.body)['data']['bookTrainer']['updated_at'];
      print(ptName);
    }
  }
}
