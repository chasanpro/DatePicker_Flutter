// ignore_for_file: file_names, camel_case_types, duplicate_ignore, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:realtime/hivedbops.dart';
import 'package:realtime/widget.dart';

// ignore: camel_case_types
class noPreset extends StatefulWidget {
  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final DateTime? initialStartDate;

  final DateTime? initialEndDate;
  final String? typeofCalandar;

  final Function(DateTime, DateTime)? startEndDateChange;

  const noPreset({
    Key? key,
    this.typeofCalandar,
    this.initialStartDate,
    this.initialEndDate,
    this.startEndDateChange,
    this.minimumDate,
    this.maximumDate,
  }) : super(key: key);

  @override
  noPresetState createState() => noPresetState();
}

class noPresetState extends State<noPreset> {
  final box = Hive.box('RealBox');
  List<DateTime> dateList = <DateTime>[];

  DateTime currentMonthDate = DateTime.now();

  DateTime? startDate;

  DateTime? endDate;

  @override
  void initState() {
    setListOfDate(currentMonthDate);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    } else if (box.get('noPreset') != null) {
      startDate = box.get('noPreset');
    } else {
      startDate = DateTime.now();
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

//getting days form month
  void setListOfDate(DateTime monthDate) {
    dateList.clear();

    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMothDay = 0;

    if (newDate.weekday < 6) {
      previousMothDay = newDate.weekday;
      //past month dates
      for (int i = 0; i <= previousMothDay + 1; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }

      dateList.removeLast();
    } else if (newDate.weekday == 7) {
      previousMothDay = 1;
      //past month dates
      for (int i = 0; i <= previousMothDay + 1; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }

      dateList.removeLast();
    }

    if (newDate.weekday == 6) {
      for (int i = 0; i < (34 - previousMothDay + 1); i++) {
        dateList.add(newDate.add(Duration(days: i + 1)));
      }
    } else if (newDate.weekday == 5) {
      for (int i = 0; i < (41 - previousMothDay); i++) {
        dateList.add(newDate.add(Duration(days: i + 1)));
      }
    } else {
      for (int i = 0; i < (34 - previousMothDay); i++) {
        dateList.add(newDate.add(Duration(days: i + 1)));
      }
    }
  }

  String action = "Never Ends";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            const SizedBox(
              width: 42,
            ),
            InkWell(
              //left Arrow
              child: Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                  ),
                  child: const Icon(Icons.arrow_left_rounded, size: 48)),
              onTap: () {
                setState(() {
                  currentMonthDate = DateTime(
                      currentMonthDate.year, currentMonthDate.month, 0);
                  setListOfDate(currentMonthDate);
                });
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  DateFormat('MMMM yyyy').format(currentMonthDate),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
            ),
            InkWell(
              child: Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                  ),
                  child: const Icon(Icons.arrow_right_rounded, size: 48)),
              onTap: () {
                setState(() {
                  currentMonthDate = DateTime(
                      currentMonthDate.year, currentMonthDate.month + 2, 0);
                  setListOfDate(currentMonthDate);
                });
              },
            ),
            const SizedBox(
              width: 42,
            ),
          ],
        ),
        //Day names
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getDaysNameUI(),
        ),
        if (dateList.length > 40) spaceBox(8),
        if (dateList.length < 40) spaceBox(6),

        Padding(
          padding: const EdgeInsets.only(right: 2, left: 2),
          child: Column(
            children: getDaysNoUI(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, bottom: 0, top: 0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 60,
                    ),
                    Text(
                      DateFormat('dd MMM yyyy').format(startDate!),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 28,
              ),
              Container(
                width: 70,
                height: MediaQuery.of(context).size.height / 20,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(1.0)),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 70,
                height: MediaQuery.of(context).size.height / 20,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(1.0)),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Crud().noPresetAdd(startDate!);
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> getDaysNameUI() {
    final List<Widget> listUI = <Widget>[];
    for (int i = 0; i < 7; i++) {
      listUI.add(
        Expanded(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 0),
              child: Text(
                DateFormat('EEE').format(dateList[i]),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return listUI;
  }

  bool isActive(String value) {
    if (value == action) {
      return true;
    }

    return false;
  }

  UpdateAction(String instruction) {
    if (instruction != "N") {
      addDAys(startDate!, int.parse(instruction));
    }
  }

  bool isThisMonth(DateTime testDate) {
    if (DateFormat('MMMM yyyy').format(testDate) ==
        DateFormat('MMMM yyyy').format(currentMonthDate)) {
      return true;
    }
    return false;
  }

  Color CellContainerColor(DateTime date) {
    if (date.day == startDate!.day &&
        date.month == startDate!.month &&
        date.year == startDate!.year) {
      return Colors.blue;
    }
    return Colors.transparent;
  }

  Color cellColor(DateTime date) {
    if (date.day == startDate!.day &&
        date.month == startDate!.month &&
        date.year == startDate!.year) {
      return Colors.white;
    } else {
      if (date.day == DateTime.now().day &&
          date.month == DateTime.now().month &&
          date.year == DateTime.now().year) {
        return Colors.blue;
      } else if (isThisMonth(date)) {
        return Colors.black;
      } else {
        return Colors.grey;
      }
    }
  }

  List<Widget> getDaysNoUI() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    for (int i = 0; i < dateList.length / 7; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < 7; i++) {
        final DateTime date = dateList[count];

        listUI.add(
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: <Widget>[
                  //Date Cells list
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {
                        onDateClick(date);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: CellContainerColor(date),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              //the text inside the cell
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                    color: cellColor(date),
                                    //past month color
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        count += 1;
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }

    return noList;
  }

//start DAte selctor
  void onDateClick(DateTime date) {
    // if (startDate!.month != date.month) {
    //   setListOfDate(startDate!);
    // }

    setState(() {
      startDate = endDate = date;
      currentMonthDate = startDate!;
      setListOfDate(currentMonthDate);
    });
  }

  bool is15(bool value) {
    return !value;
  }

  void addDAys(DateTime date, int count) {
    setState(() {
      final startDate = endDate = date.add(Duration(days: count));

      onDateClick(startDate);
    });
  }

  void work(String todo) {}
}
