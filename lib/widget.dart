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
  return SizedBox(
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
  );
}

Widget with4Presets() {
  return SizedBox(
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
  );
}

Widget with6Presets() {
  return SizedBox(
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
  );
}

Widget spaceBox(double sz) {
  return SizedBox(
    height: sz,
  );
}

calendar_() {
  return AlertDialog(
    title: new Text("Alert!!"),
    content: new Text("You are awesome!"),
    actions: const <Widget>[],
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
    child: Text("Chasanpro"),
  );
}
