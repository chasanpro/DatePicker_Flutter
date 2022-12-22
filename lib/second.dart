import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';

class second extends StatefulWidget {
  second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
      child: Column(
        children: [Text("tap")],
      ),
    );
  }
}

void getData() {
  //Hive.init('somePath') -> not needed in browser
  Hive.openBox('testBox');
  var box = Hive.box('testBox');

  print('🤣🤣🤣Name: ${box.get('name')}');
}
