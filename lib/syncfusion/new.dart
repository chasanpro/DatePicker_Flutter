import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realtime/syncfusion/six.dart';
import 'fourPreset.dart';

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
                children: [
                  Center(
                    child: SizedBox(
                      width: 130,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.blue,
                              size: 20,
                            ),
                            const Center(
                              child: Text(
                                '24 Mar 1999',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                IconData(0xe16a, fontFamily: 'MaterialIcons'),
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
