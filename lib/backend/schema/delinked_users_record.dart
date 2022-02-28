import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'delinked_users_record.g.dart';

abstract class DelinkedUsersRecord
    implements Built<DelinkedUsersRecord, DelinkedUsersRecordBuilder> {
  static Serializer<DelinkedUsersRecord> get serializer =>
      _$delinkedUsersRecordSerializer;

  @nullable
  DocumentReference get userRef;

  @nullable
  String get userCode;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DelinkedUsersRecordBuilder builder) =>
      builder..userCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('delinkedUsers');

  static Stream<DelinkedUsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DelinkedUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DelinkedUsersRecord._();
  factory DelinkedUsersRecord(
          [void Function(DelinkedUsersRecordBuilder) updates]) =
      _$DelinkedUsersRecord;

  static DelinkedUsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDelinkedUsersRecordData({
  DocumentReference userRef,
  String userCode,
}) =>
    serializers.toFirestore(
        DelinkedUsersRecord.serializer,
        DelinkedUsersRecord((d) => d
          ..userRef = userRef
          ..userCode = userCode));
