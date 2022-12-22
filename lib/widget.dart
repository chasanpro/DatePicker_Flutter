import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget realText(String label, double sz) {
  return Text(
    label,
    style: TextStyle(color: Colors.white, fontSize: sz),
  );
}

Widget realblktxt(String label, double sz) {
  return Text(
    label,
    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: sz),
  );
}

Widget withoutPreset() {
  return Padding(
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
          onPressed: () {}),
    ),
  );
}

Widget with4Presets() {
  return Padding(
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
          onPressed: () {}),
    ),
  );
}

Widget with6Presets() {
  return Padding(
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
          onPressed: () {}),
    ),
  );
}

Widget spaceBox(double sz) {
  return SizedBox(
    height: sz,
  );
}

calendar_() {
  return const AlertDialog(
    title: Text("Alert!!"),
    content: Text("You are awesome!"),
    actions: <Widget>[],
  );
}

realArrow() {
  return const Icon(
    IconData(0xee8e, fontFamily: 'MaterialIcons', matchTextDirection: true),
    size: 10,
  );
}

Widget realButton() {
  return CupertinoButton(
    onPressed: () {},
    child: const Text("Chasanpro"),
  );
}
