import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'plans_and_rates_record.g.dart';

abstract class PlansAndRatesRecord
    implements Built<PlansAndRatesRecord, PlansAndRatesRecordBuilder> {
  static Serializer<PlansAndRatesRecord> get serializer =>
      _$plansAndRatesRecordSerializer;

  @nullable
  String get phaseCode;

  @nullable
  int get fixedRatePerSqFt;

  @nullable
  double get minBookingAmtPerc;

  @nullable
  BuiltList<String> get emiTenureOptions;

  @nullable
  int get paymentDaysAllowed;

  @nullable
  DocumentReference get projectRef;

  @nullable
  DateTime get created;

  @nullable
  DateTime get lastModified;

  @nullable
  BuiltList<String> get plotsAvailable;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PlansAndRatesRecordBuilder builder) => builder
    ..phaseCode = ''
    ..fixedRatePerSqFt = 0
    ..minBookingAmtPerc = 0.0
    ..emiTenureOptions = ListBuilder()
    ..paymentDaysAllowed = 0
    ..plotsAvailable = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plansAndRates');

  static Stream<PlansAndRatesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PlansAndRatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PlansAndRatesRecord._();
  factory PlansAndRatesRecord(
          [void Function(PlansAndRatesRecordBuilder) updates]) =
      _$PlansAndRatesRecord;

  static PlansAndRatesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPlansAndRatesRecordData({
  String phaseCode,
  int fixedRatePerSqFt,
  double minBookingAmtPerc,
  int paymentDaysAllowed,
  DocumentReference projectRef,
  DateTime created,
  DateTime lastModified,
}) =>
    serializers.toFirestore(
        PlansAndRatesRecord.serializer,
        PlansAndRatesRecord((p) => p
          ..phaseCode = phaseCode
          ..fixedRatePerSqFt = fixedRatePerSqFt
          ..minBookingAmtPerc = minBookingAmtPerc
          ..emiTenureOptions = null
          ..paymentDaysAllowed = paymentDaysAllowed
          ..projectRef = projectRef
          ..created = created
          ..lastModified = lastModified
          ..plotsAvailable = null));
