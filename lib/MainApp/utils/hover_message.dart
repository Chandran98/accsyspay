import 'package:Accsys_Pay/MainApp/Theme/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.black, textColor: Colors.white);
  }

  static snackbar(message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: appColor, content: Text(message)));
  }

  // static getBusTime(String time) {
  //   return DateFormat('HH:mm').format(
  //       DateTime.fromMillisecondsSinceEpoch(int.parse(time) * 100000000000));
  // }

  static convertTo12HourFormat(String time) {
    print("TIme $time");
    String cleanTime = time.replaceAll(RegExp(r'\D'), '');

    if (cleanTime.length != 3 && cleanTime.length != 4) return 'Invalid Time';

    int hours = int.parse(cleanTime.substring(0, cleanTime.length - 2));
    int minutes = int.parse(cleanTime.substring(cleanTime.length - 2));

    // if (hours < 0 || hours > 23 || minutes < 0 || minutes > 60)
    //   return 'Invalid Time';

    String period = (hours >= 12) ? 'PM' : 'AM';
    int hour12 = (hours % 12 == 0) ? 12 : hours % 12;

    // Format the time as "hh:mm AM/PM"
    String time12Hour =
        '${hour12.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $period';
    print("sdafd${time12Hour}");
    return time12Hour;
  }
}
