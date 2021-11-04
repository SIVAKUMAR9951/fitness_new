import 'package:fitness/screens/mobility/mobilitymini.dart';
import 'package:fitness/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mobilitymain.dart';
import 'mobilitysmall.dart';
import 'mobiltymid.dart';

class Mobility extends StatefulWidget {
  const Mobility({
    Key? key,
  }) : super(key: key);

  @override
  State<Mobility> createState() => _MobilityState();
}

double _currentSliderValue = 0;

String? kvalue;

class _MobilityState extends State<Mobility> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Hero(
                      tag: 'Mobility',
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'MOBILITY',
                          style: TextStyle(
                              color: Color(0xff777777),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ]),
                  IconButton(
                      onPressed: () {
                        Get.to(const Search());
                      },
                      icon: const Hero(
                        tag: 'search',
                        child: Icon(
                          Icons.search,
                          color: Color(0xff777777),
                        ),
                      ))
                ],
              ),
              Slider(
                activeColor: Colors.yellow[900],
                inactiveColor: Colors.grey,
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 4,
                thumbColor: Colors.lime,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                  if (value == 0) {
                    setState(() {
                      kvalue = '0';
                    });
                  } else if (value == 25) {
                    setState(() {
                      kvalue = '25';
                    });
                  } else if (value == 50) {
                    setState(() {
                      kvalue = '50';
                    });
                  } else if (value == 75) {
                    setState(() {
                      kvalue = '75';
                    });
                  } else {
                    setState(() {
                      kvalue = '100';
                    });
                  }
                },
              ),
            ]),
          ),
          body: kvalue == '0'
              ? MobilityMain()
              : kvalue == '25'
                  ? MobilityMid()
                  : kvalue == '50'
                      ? MobilitySmall()
                      : kvalue == '75'
                          ? MobilityMini()
                          : MobilityMain()),
    );
  }
}
