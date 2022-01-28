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
  DateTime get lastProcessed;

  @nullable
  BuiltList<DocumentReference> get adminUsers;

  @nullable
  int get maxEMITenure;

  @nullable
  DateTime get lastModified;

  @nullable
  String get defaultPass;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AdminConstsRecordBuilder builder) => builder
    ..directPer = 0.0
    ..indirectPer = 0.0
    ..adminUsers = ListBuilder()
    ..maxEMITenure = 0
    ..defaultPass = '';

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
  DateTime lastProcessed,
  int maxEMITenure,
  DateTime lastModified,
  String defaultPass,
}) =>
    serializers.toFirestore(
        AdminConstsRecord.serializer,
        AdminConstsRecord((a) => a
          ..directPer = directPer
          ..indirectPer = indirectPer
          ..lastProcessed = lastProcessed
          ..adminUsers = null
          ..maxEMITenure = maxEMITenure
          ..lastModified = lastModified
          ..defaultPass = defaultPass));
