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
  DocumentReference get commissionUser;

  @nullable
  DocumentReference get saleTransRef;

  @nullable
  DocumentReference get commTransRef;

  @nullable
  double get commissionAmount;

  @nullable
  bool get isDirect;

  @nullable
  String get comments;

  @nullable
  DateTime get processed;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CommissionsRecordBuilder builder) => builder
    ..commissionAmount = 0.0
    ..isDirect = false
    ..comments = '';

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
  DocumentReference commissionUser,
  DocumentReference saleTransRef,
  DocumentReference commTransRef,
  double commissionAmount,
  bool isDirect,
  String comments,
  DateTime processed,
}) =>
    serializers.toFirestore(
        CommissionsRecord.serializer,
        CommissionsRecord((c) => c
          ..commissionUser = commissionUser
          ..saleTransRef = saleTransRef
          ..commTransRef = commTransRef
          ..commissionAmount = commissionAmount
          ..isDirect = isDirect
          ..comments = comments
          ..processed = processed));
