// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:realtime/hivePractice/second.dart';

// ignore: camel_case_types
class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

// ignore: camel_case_types
class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                  child: const Text("tap"),
                  onPressed: () {
                    addData();
                  }),
            ),
            Center(
              child: MaterialButton(
                  child: const Text("tap"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const second()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

addData() async {
  var box = await Hive.openBox('testBox');

  box.put('name', 'David');
}
