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
  BuiltList<int> get unProcessedSales;

  @nullable
  BuiltList<int> get processedSales;

  @nullable
  BuiltList<int> get directCommission;

  @nullable
  BuiltList<int> get indirectCommission;

  @nullable
  DateTime get lastProcessed;

  @nullable
  int get childSalesAmount;

  @nullable
  int get balanceLeftLeg;

  @nullable
  int get balanceRightLeg;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CalculationListRecordBuilder builder) =>
      builder
        ..unProcessedSales = ListBuilder()
        ..processedSales = ListBuilder()
        ..directCommission = ListBuilder()
        ..indirectCommission = ListBuilder()
        ..childSalesAmount = 0
        ..balanceLeftLeg = 0
        ..balanceRightLeg = 0;

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
}) =>
    serializers.toFirestore(
        CalculationListRecord.serializer,
        CalculationListRecord((c) => c
          ..userRef = userRef
          ..unProcessedSales = null
          ..processedSales = null
          ..directCommission = null
          ..indirectCommission = null
          ..lastProcessed = lastProcessed
          ..childSalesAmount = childSalesAmount
          ..balanceLeftLeg = balanceLeftLeg
          ..balanceRightLeg = balanceRightLeg));
