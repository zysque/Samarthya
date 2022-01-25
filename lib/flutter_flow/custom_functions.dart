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

int getSum(
  int savedAmount,
  int newAmount,
) {
  // add list data
  return savedAmount + newAmount;
}

int getDiff(
  int savedAmount,
  int newAmount,
) {
  // add list data
  return savedAmount - newAmount;
}

List<DocumentReference> addToList(
  List<DocumentReference> parentsList,
  DocumentReference newParent,
) {
  // add to list
  if (parentsList == null) {
    parentsList = <DocumentReference>[];
  }
  parentsList..add(newParent);
  return parentsList;
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
