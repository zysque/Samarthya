import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int getTotalAmount(List<int> salesAmounts) {
  // add list data
  return salesAmounts.fold(0, (sum, element) => sum + element);
}

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

String stringFromList(List<int> optionList) {
  // make string from list elements
  String retString = "";

  optionList.forEach((element) {
    if (element != optionList[optionList.length - 1])
      retString += "$element    ";
    else
      retString += "$element";
  });

  return retString;
}

int getCommission(
  double percentage,
  int amount,
) {
  // a percent b
  return ((percentage / 100) * amount).round();
  ;
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
  return emiAmount;
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

double getDiffD(
  double val1,
  double val2,
) {
  // Add your function code here!
  return val1 - val2;
}

bool validateBookingAmount(
  double bookingAmount,
  double expected,
) {
  // Add your function code here!
  return (bookingAmount - expected) < 0;
}

DateTime getDayPlusTimeStamp(int extraDays) {
  // add Days to current timestamp
  return DateTime.now().add(Duration(days: extraDays));
}

int getTimeStampDiff(DateTime timeStamp) {
  // Time Difference from today
  return DateTime.fromMillisecondsSinceEpoch(timeStamp.millisecondsSinceEpoch)
      .day;
}
