import 'package:flutter/material.dart';

class InstaGram extends StatefulWidget {
  const InstaGram({Key? key}) : super(key: key);

  @override
  _InstaGramState createState() => _InstaGramState();
}

class _InstaGramState extends State<InstaGram> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: isExpanded ? 70 : 100,
              width: isExpanded ? size.width * 0.9 : size.width * 0.6,
              height: isExpanded ? size.height * 0.7 : size.height * 0.5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('ocation.addressLine1'),
                    SizedBox(height: 8),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              child: GestureDetector(
                onPanUpdate: onPanUpdate,
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    'assets/1.png',
                  ),
                ),
              ),
              duration: const Duration(milliseconds: 500),
              bottom: isExpanded ? 150 : 100,
            ),
          ],
        ),
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
