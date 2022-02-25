import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double getSum(
  double val1,
  double val2,
) {
  // add list data
  return val1 + val2;
}

double getDiff(
  double va1,
  double val2,
) {
  // difference of two numbers
  double d1 = va1;
  double d2 = val2;
  if (val2 > va1) return d2 - d1;
  if (val2 < va1) return d1 - d2;
  return 0.0;
}

double getCommission(
  double percentage,
  double amount,
) {
  // a percent b
  return ((percentage / 100) * amount).ceilToDouble();
}

bool getAndOutput(
  bool op1,
  bool op2,
) {
  // apply and operator
  return op1 && op2;
}

double emiCalculator(
  int plotArea,
  int ratePerSQFT,
  double bookingAmount,
  double downPayment,
  String tenure,
) {
  // calculate interest amount
  final int tenureY = int.parse(tenure.replaceAll(' Months', ''));
  double emiAmount =
      ((plotArea * ratePerSQFT) - bookingAmount - downPayment) / tenureY;
  return emiAmount.ceilToDouble();
}

int parseReplaceFromString(
  String str1,
  String str2,
) {
  // Add your function code here!
  return int.parse(str1.replaceAll(str2, ''));
}

double getMultiplication(
  double val1,
  double val2,
) {
  // Add your function code here!
  return val1 * val2;
}

int getDaysLeft(DateTime timeStamp) {
  // get timestamp difference from current date
  Duration difference = timeStamp.difference(DateTime.now());

  return difference.inDays.abs();
}

bool getIfDaysLeft(DateTime timeStamp) {
  // get timestamp difference from current date
  Duration difference = timeStamp.difference(DateTime.now());

  return (difference.inDays) > 0;
}

double getDivision(
  double val1,
  double val2,
) {
  // Add your function code here!
  return val1 / val2;
}

int getQuotient(
  double val1,
  double val2,
) {
  // Add your function code here!
  return (val1 / val2).round();
}

DateTime getNewDate(
  DateTime date1,
  int addYear,
  int addMonth,
  double day,
  bool condn,
  DateTime date2,
) {
  // get next month
  return condn
      ? DateTime.parse(DateFormat('yyyy-MM-dd').format(
          DateTime(
            date1.year + addYear + (date1.month + addMonth > 12 ? 1 : 0),
            (date1.month + addMonth < 12) ? date1.month + addMonth : 1,
            day.floor(),
          ),
        ))
      : date2;
}

DateTime getPaymentDate(
  double addDay,
  bool isEmi,
  double day,
  double reminderBefore,
) {
  // get next month
  DateTime today = DateTime.now();
  bool allowed = ((30 + day) - today.day) > reminderBefore.floor();
  int addMonth = allowed ? 1 : 2;
  return isEmi
      ? DateTime.parse(DateFormat('yyyy-MM-dd').format(
          DateTime(
              today.year + (today.month + addMonth > 12 ? 1 : 0),
              (today.month + addMonth < 12) ? today.month + addMonth : 1,
              day.floor(),
              0,
              0,
              0,
              0,
              0),
        ))
      : today.add(Duration(
          days: addDay.floor(),
        ));
}

double getBookingAmt(
  double perc,
  double rate,
  int area,
) {
  // Add your function code here!
  return (area * rate * perc).ceilToDouble();
}

List<String> getNumbersInBetween(
  int start,
  int end,
) {
  // add to list while start is less than end

  final these = <String>[];
  var n = 0;
  if (start <= end) {
    n = start;
  } else {
    n = end;
  }

  while (n < end) {
    these.add(n.toString());
    n += 1;
  }
  return these;
}

String getPaddedNumber(int number) {
  // pad number to 5 digit
  int newNum = number + 1;
  return newNum.toString().padLeft(5, '0');
}

LatLng getLocation(
  String lat,
  String lng,
) {
  // get LatLng from strings
  return LatLng(double.parse(lat), double.parse(lng));
}

String encryptData(
  int intData,
  String strData,
  bool isInt,
) {
  // Add your function code here!
  String encodedStr = "";
  if (isInt) {
    while (intData > 0) {
      encodedStr += String.fromCharCode((intData % 10) + 65);
      intData = (intData / 10).floor();
    }
  } else {
    for (int i = 0; i < strData.length; i++) {
      if (int.tryParse(strData[i]) == null) {
        encodedStr += strData.codeUnitAt(i).toString();
      } else {
        int pos = int.tryParse(strData[i]) + 65;
        encodedStr += String.fromCharCode(pos);
      }
    }
  }
  return encodedStr;
}

int decryptIntData(String data) {
  // Add your function code here!
  int decodedInt = 0;
  for (int i = data.length - 1; i >= 0; i--) {
    decodedInt = decodedInt * 10 + (data.codeUnitAt(i) - 65);
  }
  return decodedInt;
}

String decryptStringData(String data) {
  // Add your function code here!
  String decodedStr = "";
  for (int i = 0; i < data.length; i++) {
    if (int.tryParse(data[i]) == null) {
      int pos = data.codeUnitAt(i) - 65;
      decodedStr += pos.toString();
    } else {
      int pos = int.tryParse(data.substring(i, i + 2));
      decodedStr += String.fromCharCode(pos);
      i++;
    }
  }
  return decodedStr;
}
