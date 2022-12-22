// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realtime/hivedbops.dart';

import 'package:realtime/syncfusion/fourPreset.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:realtime/syncfusion/six.dart';
import 'package:realtime/widget.dart';

import 'noPreset.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('RealBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: "Chaitanya"));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final box = Hive.box('RealBox');
  refresh() {
    final box = Hive.box('RealBox');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double realwidth = MediaQuery.of(context).size.width; // Gives the width
    double realheight = MediaQuery.of(context).size.height; // Gives the height
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            spaceBox(realheight / 6),
            InkWell(
                onTap: () {
                  print(box.get('noPreset'));
                  print(box.get('fourPreset'));
                  print(box.get('sixPreset'));
                },
                child: realblktxt("Calendar widgets", 20)),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 400,
                    child: CupertinoButton(
                        color: const Color.fromARGB(255, 45, 152, 240),
                        child: const Text(
                          "Without preset",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  insetPadding: const EdgeInsets.all(4),
                                  content: const FractionallySizedBox(
                                      widthFactor: .99,
                                      heightFactor: 0.531,
                                      child: noPreset()),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(),
                                  ),
                                );
                              }).then((value) => {refresh()});
                        }),
                  ),
                ),
                if (box.get('noPreset') != null)
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
                            Center(
                              child: Text(
                                parser(box.get('noPreset')),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                box.delete('noPreset');
                                refresh();
                              },
                              child: const Icon(
                                IconData(0xe16a, fontFamily: 'MaterialIcons'),
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (box.get('noPreset') == null)
                  const SizedBox(
                    width: 130,
                    height: 40,
                  )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 400,
                    child: CupertinoButton(
                        color: const Color.fromARGB(255, 45, 152, 240),
                        child: const Text(
                          "Without 4 presets",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  insetPadding: const EdgeInsets.all(12),
                                  content: const FractionallySizedBox(
                                    child: Expanded(child: fourPreset()),
                                    widthFactor: .99,
                                    heightFactor: .7,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(),
                                  ),
                                );
                              }).then((value) => {refresh()});
                        }),
                  ),
                ),
                if (box.get('fourPreset') != null)
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
                            Center(
                              child: Text(
                                parser(box.get('fourPreset')),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                box.delete('fourPreset');
                                refresh();
                              },
                              child: const Icon(
                                IconData(0xe16a, fontFamily: 'MaterialIcons'),
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (box.get('fourPreset') == null)
                  const SizedBox(
                    width: 130,
                    height: 40,
                  )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 400,
                    child: CupertinoButton(
                        color: const Color.fromARGB(255, 45, 152, 240),
                        child: const Text(
                          "Without 6 preset",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  insetPadding: const EdgeInsets.all(12),
                                  content: Container(
                                    child: const sixpreset(),
                                    width: realwidth,
                                    height: realheight / 1.4,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(),
                                  ),
                                );
                              }).then((value) => {refresh()});
                          ;
                        }),
                  ),
                ),
                if (box.get('sixPreset') != null)
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
                            Center(
                              child: Text(
                                parser(box.get('sixPreset')),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                box.delete('sixPreset');
                                refresh();
                              },
                              child: const Icon(
                                IconData(0xe16a, fontFamily: 'MaterialIcons'),
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (box.get('sixPreset') == null)
                  const SizedBox(
                    width: 130,
                    height: 40,
                  )
              ],
            ),
            spaceBox(realheight / 6),
            realblktxt("Chaitanya Damarasingu", 12),
          ],
        ),
      ),
    );
  }

  Future<void> deleteDate(key) async {
    var boz = await Hive.box('RealBox');
    box.delete(key);
  }
}
