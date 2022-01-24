import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'calculation_list_record.g.dart';

abstract class CalculationListRecord
    implements Built<CalculationListRecord, CalculationListRecordBuilder> {
  static Serializer<CalculationListRecord> get serializer =>
      _$calculationListRecordSerializer;

  @nullable
  DocumentReference get userRef;

  @nullable
  DateTime get lastProcessed;

  @nullable
  int get childSalesAmount;

  @nullable
  int get balanceLeftLeg;

  @nullable
  int get balanceRightLeg;

  @nullable
  int get unProcessedAmount;

  @nullable
  int get processedAmount;

  @nullable
  int get directCommissionAmount;

  @nullable
  int get indirectCommissionAmount;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CalculationListRecordBuilder builder) =>
      builder
        ..childSalesAmount = 0
        ..balanceLeftLeg = 0
        ..balanceRightLeg = 0
        ..unProcessedAmount = 0
        ..processedAmount = 0
        ..directCommissionAmount = 0
        ..indirectCommissionAmount = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calculationList');

  static Stream<CalculationListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CalculationListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CalculationListRecord._();
  factory CalculationListRecord(
          [void Function(CalculationListRecordBuilder) updates]) =
      _$CalculationListRecord;

  static CalculationListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCalculationListRecordData({
  DocumentReference userRef,
  DateTime lastProcessed,
  int childSalesAmount,
  int balanceLeftLeg,
  int balanceRightLeg,
  int unProcessedAmount,
  int processedAmount,
  int directCommissionAmount,
  int indirectCommissionAmount,
}) =>
    serializers.toFirestore(
        CalculationListRecord.serializer,
        CalculationListRecord((c) => c
          ..userRef = userRef
          ..lastProcessed = lastProcessed
          ..childSalesAmount = childSalesAmount
          ..balanceLeftLeg = balanceLeftLeg
          ..balanceRightLeg = balanceRightLeg
          ..unProcessedAmount = unProcessedAmount
          ..processedAmount = processedAmount
          ..directCommissionAmount = directCommissionAmount
          ..indirectCommissionAmount = indirectCommissionAmount));
