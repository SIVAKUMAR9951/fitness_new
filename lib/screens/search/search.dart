import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

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
                  tag: 'search',
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'SEARCH',
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
        body: const Center(child: Text('Search Page')),
      ),
    );
  }
}
