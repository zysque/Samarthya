import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'admin_consts_record.g.dart';

abstract class AdminConstsRecord
    implements Built<AdminConstsRecord, AdminConstsRecordBuilder> {
  static Serializer<AdminConstsRecord> get serializer =>
      _$adminConstsRecordSerializer;

  @nullable
  double get directPer;

  @nullable
  double get indirectPer;

  @nullable
  BuiltList<DocumentReference> get adminUsers;

  @nullable
  DateTime get lastModified;

  @nullable
  int get usersCount;

  @nullable
  int get comPPeriod;

  @nullable
  DateTime get lastProcessed;

  @nullable
  double get emiPaymentDay;

  @nullable
  double get reminderBeforeDays;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AdminConstsRecordBuilder builder) => builder
    ..directPer = 0.0
    ..indirectPer = 0.0
    ..adminUsers = ListBuilder()
    ..usersCount = 0
    ..comPPeriod = 0
    ..emiPaymentDay = 0.0
    ..reminderBeforeDays = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adminConsts');

  static Stream<AdminConstsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AdminConstsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AdminConstsRecord._();
  factory AdminConstsRecord([void Function(AdminConstsRecordBuilder) updates]) =
      _$AdminConstsRecord;

  static AdminConstsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAdminConstsRecordData({
  double directPer,
  double indirectPer,
  DateTime lastModified,
  int usersCount,
  int comPPeriod,
  DateTime lastProcessed,
  double emiPaymentDay,
  double reminderBeforeDays,
}) =>
    serializers.toFirestore(
        AdminConstsRecord.serializer,
        AdminConstsRecord((a) => a
          ..directPer = directPer
          ..indirectPer = indirectPer
          ..adminUsers = null
          ..lastModified = lastModified
          ..usersCount = usersCount
          ..comPPeriod = comPPeriod
          ..lastProcessed = lastProcessed
          ..emiPaymentDay = emiPaymentDay
          ..reminderBeforeDays = reminderBeforeDays));
