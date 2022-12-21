import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realtime/syncfusion/six.dart';
import 'cc.dart';

class newpractice extends StatefulWidget {
  const newpractice({Key? key}) : super(key: key);

  @override
  State<newpractice> createState() => _newpracticeState();
}

class _newpracticeState extends State<newpractice> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Date Range Picker",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, bottom: 16),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[sixpreset()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
