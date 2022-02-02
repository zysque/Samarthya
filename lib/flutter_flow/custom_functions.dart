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
  return ((percentage / 100) * amount);
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
  return emiAmount.roundToDouble();
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
) {
  // get next month
  return DateTime.parse(DateFormat('yyyy-MM-dd').format(
    DateTime(
      date1.year + addYear + (date1.month + addMonth > 12 ? 1 : 0),
      (date1.month + addMonth < 12) ? date1.month + addMonth : 1,
      day.floor(),
    ),
  ));
}

double getBookingAmt(
  double perc,
  double rate,
  int area,
) {
  // Add your function code here!
  return area * rate * perc;
}
