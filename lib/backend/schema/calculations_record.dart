import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'calculations_record.g.dart';

abstract class CalculationsRecord
    implements Built<CalculationsRecord, CalculationsRecordBuilder> {
  static Serializer<CalculationsRecord> get serializer =>
      _$calculationsRecordSerializer;

  @nullable
  DocumentReference get userRef;

  @nullable
  double get directCommission;

  @nullable
  double get indirectCommission;

  @nullable
  double get emiDueAmount;

  @nullable
  DateTime get emiDueDate;

  @nullable
  int get defaultPayments;

  @nullable
  DateTime get comissionProcessed;

  @nullable
  int get transCount;

  @nullable
  String get userCode;

  @nullable
  double get unPBusinessAmt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CalculationsRecordBuilder builder) => builder
    ..directCommission = 0.0
    ..indirectCommission = 0.0
    ..emiDueAmount = 0.0
    ..defaultPayments = 0
    ..transCount = 0
    ..userCode = ''
    ..unPBusinessAmt = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calculations');

  static Stream<CalculationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CalculationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CalculationsRecord._();
  factory CalculationsRecord(
          [void Function(CalculationsRecordBuilder) updates]) =
      _$CalculationsRecord;

  static CalculationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCalculationsRecordData({
  DocumentReference userRef,
  double directCommission,
  double indirectCommission,
  double emiDueAmount,
  DateTime emiDueDate,
  int defaultPayments,
  DateTime comissionProcessed,
  int transCount,
  String userCode,
  double unPBusinessAmt,
}) =>
    serializers.toFirestore(
        CalculationsRecord.serializer,
        CalculationsRecord((c) => c
          ..userRef = userRef
          ..directCommission = directCommission
          ..indirectCommission = indirectCommission
          ..emiDueAmount = emiDueAmount
          ..emiDueDate = emiDueDate
          ..defaultPayments = defaultPayments
          ..comissionProcessed = comissionProcessed
          ..transCount = transCount
          ..userCode = userCode
          ..unPBusinessAmt = unPBusinessAmt));
