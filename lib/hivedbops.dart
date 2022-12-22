import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Crud {
  final box = Hive.box('RealBox');
  noPresetAdd(DateTime date) async {
    box.put('noPreset', date);
  }

  fourPresetAdd(DateTime date) async {
    box.put('fourPreset', date);
  }

  sixPresetAdd(DateTime date) async {
    box.put('sixPreset', date);
  }

  valueCheck1() async {
    return box.get('nopreset');
  }

  valueCheck2() async {
    var box = await Hive.openBox('RealBox');
    return box.get('fourpreset');
  }

  valueCheck3() async {
    var box = await Hive.openBox('RealBox');
    return box.get('sixpreset');
  }

  readDates() {
    print(box.get('noPreset'));
    print(box.get('fourPreset'));
    print(box.get('sixPreset'));
  }
}

parser(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date);
}
