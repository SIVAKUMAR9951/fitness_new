import 'package:fitness/screens/qr/qr.dart';
import 'package:fitness/screens/logins/ig.dart';
import 'package:fitness/screens/logins/sign_in.dart';
import 'package:fitness/screens/logins/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  bool _passwordVisible = false;

  final ButtonStyle style = ElevatedButton.styleFrom(
      primary: const Color(0xff6B6B6B),
      textStyle: const TextStyle(
        fontSize: 20,
      ),
      shadowColor: Colors.black54);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/signin_logo.png'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        color: Color(0xff777777),
                        fontSize: 17,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.12,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  controller: textEditingController1,
                  decoration: const InputDecoration(
                      suffixIcon:
                          Icon(Icons.phone_iphone, color: Color(0xff777777)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff777777),
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'PHONE NUMBER / EMAIL',
                      hintText: '9876543210/test@gmail.com'),
                  validator: (val) => val!.isEmpty
                      ? 'Please provide a valid Phonenumber or email !'
                      : null,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.white),
                  controller: textEditingController2,
                  obscureText:
                      !_passwordVisible, //This will obscure text dynamically
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff777777),
                      ),
                    ),
                    labelText: 'PASSWORD',
                    border: const OutlineInputBorder(),

                    hintText: 'Enter your password',

                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _passwordVisible
                            ? Colors.blue[100]
                            : const Color(0xff777777),
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.white),
                  controller: textEditingController2,
                  obscureText:
                      !_passwordVisible, //This will obscure text dynamically
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff777777),
                      ),
                    ),
                    labelText: 'CONFIRM PASSWORD',
                    border: const OutlineInputBorder(),

                    hintText: 'Enter your password',

                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _passwordVisible
                            ? Colors.blue[100]
                            : const Color(0xff777777),
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () {
                      Get.to(const SignIn());
                    },
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "back to ",
                          style: TextStyle(
                            color: Color(0xff777777),
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.12,
                          ),
                        ),
                        TextSpan(
                          text: "SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.12,
                          ),
                        ),
                      ]),
                    ),
                  ),
                )
              ]),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const SignUp());
                },
                child: const Text(
                  "CREATE NEW ACCOUNT",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff777777),
                    fontSize: 15,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.12,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 100,
                    color: const Color(0xff777777),
                  ),
                  const Text(
                    '  OR SIGN IN WITH  ',
                    style: TextStyle(
                      fontSize: 17,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xff777777),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 100,
                    color: const Color(0xff777777),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // Get.to(BarCode());
                    },
                    icon: Image.asset(
                      'assets/fb.png',
                      color: const Color(0xff777777),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(const InstaGram());
                    },
                    icon: Image.asset(
                      'assets/ig.png',
                      color: const Color(0xff777777),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
