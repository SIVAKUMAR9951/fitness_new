import 'dart:convert';
import 'dart:typed_data';
import 'package:fitness/screens/dashboard/main_dashboard.dart';
import 'package:fitness/screens/userprofile/user_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:fitness/api/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  final formKey = GlobalKey<FormState>();
  TextEditingController name1 = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender1 = TextEditingController();
  TextEditingController country1 = TextEditingController();
  TextEditingController language1 = TextEditingController();
  TextEditingController mobile1 = TextEditingController();
  TextEditingController email1 = TextEditingController();

  PickedFile? imageFile;
  XFile? pickedFile;
  String? image;
  String? uName;
  String? authToken;
  String? genVal = "male";
  bool isLoading = false;
  final int _value = 0;
  String? base64Image;
  Uint8List? _bytesImage;

  String? pic;
  String? picname;
  String? picphone;
  String? picemail;
  String? notificationControl;
  bool isStatus = false;
  List profileDetails = [];
  String? profilePicture;
  bool isSwitched = false;
  bool isSwitched1 = false;
  String? lan = "English";

  // bool isSwitched = false;
  String? dropdownvalue, dropdownvalue1, dropdownvalue2;
  var items = ['ENGLISH', 'HINDI', 'SPANISH'];
  var country = ['INDIA', 'UAE', 'USA'];
  var gender = ['MALE', 'FEMALE'];

  Future profileData() async {
    setState(() {
      isStatus == false;
    });

    final SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString('id')!.toString();
    Map data = {'user_id': id};
    var result = await http.post(
      Uri.parse(ApiService.userprofile),
      body: data,
    );
    if (result.statusCode == 200) {
      setState(() {
        // profileDetails = json.decode(result.body)['data']['user'];
        isStatus == true;

        name1.text = json.decode(result.body)['data']['user']['name'] ?? '';
        email1.text = json.decode(result.body)['data']['user']['email'] ?? "";
        mobile1.text =
            json.decode(result.body)['data']['user']['mobile_no'] ?? "";
        dob.text = json.decode(result.body)['data']['user']['dob'] ?? "";
        gender1.text = json.decode(result.body)['data']['user']['gender'] ?? "";
        country1.text =
            json.decode(result.body)['data']['user']['country'] ?? 'INDIA';
        language1.text =
            json.decode(result.body)['data']['user']['language'] ?? 'ENGLISH';
      });
    } else {
      profileDetails = [];
      isStatus == true;
    }
    return profileDetails;
  }

  @override
  void initState() {
    profileData();
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
          child: Form(
            key: formKey,
            child: Container(
              width: double.infinity,
              height: 1200,
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
                        Row(
                          children: const [
                            Text(
                              'NAME',
                              style: TextStyle(
                                  color: Color(0xff777777),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: const TextStyle(
                              color: Color(0xff777777),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              decorationThickness: 0.0),
                          textCapitalization: TextCapitalization.words,
                          controller: name1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Name',
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Name should not be Empty' : null,
                        ),
                        Row(
                          children: const [
                            Text(
                              'DOB',
                              style: TextStyle(
                                  color: Color(0xff777777),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textCapitalization: TextCapitalization.words,
                          controller: dob,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Date of Birth',
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Please enter DOB' : null,
                        ),
                        Row(
                          children: const [
                            Text(
                              'LANGUAGE',
                              style: TextStyle(
                                  color: Color(0xff777777),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textCapitalization: TextCapitalization.words,
                          controller: language1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Language',
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Please Enter the Language' : null,
                        ),
                        Row(
                          children: const [
                            Text(
                              'GENDER',
                              style: TextStyle(
                                  color: Color(0xff777777),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textCapitalization: TextCapitalization.words,
                          controller: gender1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'GENDER',
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Male/Female' : null,
                        ),
                        Row(
                          children: const [
                            Text(
                              'COUNTRY',
                              style: TextStyle(
                                  color: Color(0xff777777),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textCapitalization: TextCapitalization.words,
                          controller: country1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Country',
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Please enter Country ' : null,
                        ),
                        Row(
                          children: const [
                            Text(
                              'MOBILE NUMBER',
                              style: TextStyle(
                                  color: Color(0xff777777),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color(0xff777777),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textCapitalization: TextCapitalization.words,
                          controller: mobile1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'MOBILE',
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Please enter number' : null,
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
                        TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              settingData();
                            }
                          },
                          child: const Text(
                            'SAVE',
                            style: TextStyle(
                                color: Color(0xFF423E3A),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
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
      ),
    );
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd MMMM yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  Future<void> settingData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString("id")!.toString();
    print(id);
    Map data = {
      'name': name1.text,
      'email': email1.text,
      'user_id': id,
      'mobile_no': mobile1.text,
      'gender': gender1.text,
    };
    var result = await http.post(
      Uri.parse(ApiService.editprofile),
      body: data,
    );
    print(result.body);
    print(result.statusCode);
    var getdata = json.decode(result.body)['message'];
    print(getdata);
    if (result.statusCode == 200) {
      if (json.decode(result.body)['code'] == 200) {
        Get.to(() => const MainDashBoard());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.teal[400],
            content: Text(getdata.toString()),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(getdata.toString()),
          ),
        );
      }

      // phone = json.decode(result.body)['data']['user']['mobile_no'];
      // imagepic = json.decode(result.body)['data']['user']['image'];
    }
  }
}
