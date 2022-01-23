import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'commissions_record.g.dart';

abstract class CommissionsRecord
    implements Built<CommissionsRecord, CommissionsRecordBuilder> {
  static Serializer<CommissionsRecord> get serializer =>
      _$commissionsRecordSerializer;

  @nullable
  String get projectName;

  @nullable
  int get commissionAmount;

  @nullable
  String get commissionType;

  @nullable
  DateTime get commissionCreated;

  @nullable
  DocumentReference get commissionUser;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CommissionsRecordBuilder builder) => builder
    ..projectName = ''
    ..commissionAmount = 0
    ..commissionType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commissions');

  static Stream<CommissionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CommissionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CommissionsRecord._();
  factory CommissionsRecord([void Function(CommissionsRecordBuilder) updates]) =
      _$CommissionsRecord;

  static CommissionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCommissionsRecordData({
  String projectName,
  int commissionAmount,
  String commissionType,
  DateTime commissionCreated,
  DocumentReference commissionUser,
}) =>
    serializers.toFirestore(
        CommissionsRecord.serializer,
        CommissionsRecord((c) => c
          ..projectName = projectName
          ..commissionAmount = commissionAmount
          ..commissionType = commissionType
          ..commissionCreated = commissionCreated
          ..commissionUser = commissionUser));
