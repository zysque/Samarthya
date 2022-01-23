import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sales_list_record.g.dart';

abstract class SalesListRecord
    implements Built<SalesListRecord, SalesListRecordBuilder> {
  static Serializer<SalesListRecord> get serializer =>
      _$salesListRecordSerializer;

  @nullable
  DocumentReference get saleUser;

  @nullable
  BuiltList<String> get sales;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SalesListRecordBuilder builder) =>
      builder..sales = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('salesList');

  static Stream<SalesListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SalesListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SalesListRecord._();
  factory SalesListRecord([void Function(SalesListRecordBuilder) updates]) =
      _$SalesListRecord;

  static SalesListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSalesListRecordData({
  DocumentReference saleUser,
}) =>
    serializers.toFirestore(
        SalesListRecord.serializer,
        SalesListRecord((s) => s
          ..saleUser = saleUser
          ..sales = null));
