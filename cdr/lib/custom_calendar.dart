import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final DateTime? initialStartDate;

  final DateTime? initialEndDate;

  final Function(DateTime, DateTime)? startEndDateChange;

  const CustomCalendar({
    Key? key,
    this.initialStartDate,
    this.initialEndDate,
    this.startEndDateChange,
    this.minimumDate,
    this.maximumDate,
  }) : super(key: key);

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
  List<DateTime> dateList = <DateTime>[];

  DateTime currentMonthDate = DateTime.now();

  DateTime? startDate;

  DateTime? endDate;

  @override
  void initState() {
    setListOfDate(currentMonthDate);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
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
    var x = 0;
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMothDay = 0;
    print(" Week day : ${newDate.weekday}");
    if (newDate.weekday < 6) {
      previousMothDay = newDate.weekday;
      //past month dates
      for (int i = 0; i <= previousMothDay + 1; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }
      print(" previous ${dateList.length - 1}");
      dateList.removeLast();
    } else if (newDate.weekday == 7) {
      previousMothDay = 1;
      //past month dates
      for (int i = 0; i <= previousMothDay + 1; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }
      print(" previous ${dateList.length - 1}");
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
    print(dateList.length);
  }

  @override
  Widget build(BuildContext context) {
    // Main Column
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 4.0, right: 4.0, top: 4, bottom: 4),
          //Header Row
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 35,
              ),
              InkWell(
                //left Arrow
                child: Ink(
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                    ),
                    child: const Icon(Icons.arrow_left_rounded, size: 52)),
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
                    child: const Icon(Icons.arrow_right_rounded, size: 52)),
                onTap: () {
                  setState(() {
                    currentMonthDate = DateTime(
                        currentMonthDate.year, currentMonthDate.month + 2, 0);
                    setListOfDate(currentMonthDate);
                  });
                },
              ),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
        ),
        //Day names
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getDaysNameUI(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 2, left: 2),
          child: Column(
            children: getDaysNoUI(),
          ),
        ),
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat('EEE').format(dateList[i]),
                style: const TextStyle(
                  fontSize: 14,
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

  bool isThisMonth(DateTime testDate) {
    DateTime now = DateTime.now();
    if (DateFormat('MMMM yyyy').format(testDate) ==
        DateFormat('MMMM yyyy').format(currentMonthDate)) {
      return true;
    }
    return false;
  }

  Color cellColor(DateTime date) {
    if (date == startDate) {
      return Colors.white;
    } else if (isThisMonth(date)) {
      return Colors.black;
    }
    return Colors.grey;
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
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 27,
                          height: 25,
                          child: Container(
                            width: 27,
                            height: 25,
                            decoration: BoxDecoration(
                              color: date == startDate
                                  ? Colors.blue
                                  : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(32.0)),
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
                                    fontSize: 12,
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

  // bool getIsInRange(DateTime date) {
  //   if (startDate != null && endDate != null) {
  //     if (date.isAfter(startDate!) && date.isBefore(endDate!)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     return false;
  //   }
  // }

//start DAte selctor
  void onDateClick(DateTime date) {
    print("Date selected :: $date");
    setState(() {
      final startDate = endDate = date;
    });
  }
}
