import 'package:flutter/material.dart';

class Hello extends StatefulWidget {
  final String? subject;
  const Hello({Key? key, required this.subject}) : super(key: key);

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  void initState() {
    print(widget.subject);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.subject.toString()),
      ),
    );
  }
}
