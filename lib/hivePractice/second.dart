// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    getData();
    return Column(
      children: const [Text("tap")],
    );
  }
}

void getData() {
  //Hive.init('somePath') -> not needed in browser
  Hive.openBox('testBox');
  var box = Hive.box('testBox');

  print('Name: ${box.get('name')}');
}
