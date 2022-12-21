import 'package:flutter/material.dart';
import 'package:realtime/syncfusion/new.dart';

import 'package:realtime/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: newpractice());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double realwidth = MediaQuery.of(context).size.width; // Gives the width
    double realheight = MediaQuery.of(context).size.height; // Gives the height
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            spaceBox(realheight / 15),
            InkWell(
                child: realblktxt("Calendar widgets", 20),
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 255, 215, 197),
                            ),
                          ),
                          title: realText("esdiufhgdf", 14),
                          actions: [
                            realText("esdiufhgdf", 14),
                          ]);
                    },
                  );
                }),
            withoutPreset(),
            with4Presets(),
            spaceBox(10),
            with6Presets(),
            spaceBox(5),
            spaceBox(realheight / 15),
            realblktxt("Chaitanya Damarasingu", 15),
          ],
        ),
      ),
    );
  }
}
