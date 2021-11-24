import 'package:fitness/controller/catagories_controller.dart';
import 'package:fitness/controller/wod_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Wods extends StatefulWidget {
  const Wods({Key? key}) : super(key: key);

  @override
  _WodsState createState() => _WodsState();
}

class _WodsState extends State<Wods> {
  var wodController = Get.put(WodController());
  @override
  void initState() {
    Get.put(WodController());
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
                  child: Text(
                    'WOD',
                    style: TextStyle(
                        color: Color(0xff777777),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              ]),
            ],
          ),
        ),
        body: Obx(
          () {
            return wodController.postloading.value
                ? Center(
                    child: Image.network(
                        'https://cdn.dribbble.com/users/26878/screenshots/3544693/07-loader.gif'),
                  )
                : wodController.getWods.isEmpty
                    ? const Center(
                        child: Text(
                          "No Data Found..",
                        ),
                      )
                    : StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: wodController.getWods.length,
                        itemBuilder: (BuildContext context, int index) => Stack(
                          fit: StackFit.expand,
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            ClipRRect(
                              child: Image.network(
                                'https://cdn.dribbble.com/users/26878/screenshots/3544693/07-loader.gif',
                                // wodController.getWods[index].image.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    wodController.getWods[index].status
                                        .toString(),
                                    style: const TextStyle(
                                      color: Color(0xFFC98506),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                  ),
                                ])
                          ],
                        ),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(1, index.isOdd ? 0.5 : 1),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      );
          },
        ),
      ),
    );
  }
}
