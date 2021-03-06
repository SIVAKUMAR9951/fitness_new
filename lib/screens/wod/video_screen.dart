import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'chewie.dart';

class WodVideoScreen extends StatelessWidget {
  const WodVideoScreen({Key? key}) : super(key: key);

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
                      'WORKOUT HISTORY',
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
                  Icons.search_rounded,
                  color: Color(0xff777777),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'WorkOut Video',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ChewieListItem(
              videoPlayerController: VideoPlayerController.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
              looping: true,
            ),
          ],
        ),
      ),
    );
  }
}
