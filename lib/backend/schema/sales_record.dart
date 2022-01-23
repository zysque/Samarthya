import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sales_record.g.dart';

abstract class SalesRecord implements Built<SalesRecord, SalesRecordBuilder> {
  static Serializer<SalesRecord> get serializer => _$salesRecordSerializer;

  @nullable
  int get sid;

  @nullable
  String get projectName;

  @nullable
  int get saleAmount;

  @nullable
  String get saleDesc;

  @nullable
  DateTime get saleCreated;

  @nullable
  DocumentReference get saleUser;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SalesRecordBuilder builder) => builder
    ..sid = 0
    ..projectName = ''
    ..saleAmount = 0
    ..saleDesc = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sales');

  static Stream<SalesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SalesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SalesRecord._();
  factory SalesRecord([void Function(SalesRecordBuilder) updates]) =
      _$SalesRecord;

  static SalesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSalesRecordData({
  int sid,
  String projectName,
  int saleAmount,
  String saleDesc,
  DateTime saleCreated,
  DocumentReference saleUser,
}) =>
    serializers.toFirestore(
        SalesRecord.serializer,
        SalesRecord((s) => s
          ..sid = sid
          ..projectName = projectName
          ..saleAmount = saleAmount
          ..saleDesc = saleDesc
          ..saleCreated = saleCreated
          ..saleUser = saleUser));
