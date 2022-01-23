import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'child_hierarchies_record.g.dart';

abstract class ChildHierarchiesRecord
    implements Built<ChildHierarchiesRecord, ChildHierarchiesRecordBuilder> {
  static Serializer<ChildHierarchiesRecord> get serializer =>
      _$childHierarchiesRecordSerializer;

  @nullable
  DocumentReference get childRef;

  @nullable
  String get childEmail;

  @nullable
  DocumentReference get parentRef;

  @nullable
  String get parentLeg;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ChildHierarchiesRecordBuilder builder) =>
      builder
        ..childEmail = ''
        ..parentLeg = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('childHierarchies');

  static Stream<ChildHierarchiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ChildHierarchiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ChildHierarchiesRecord._();
  factory ChildHierarchiesRecord(
          [void Function(ChildHierarchiesRecordBuilder) updates]) =
      _$ChildHierarchiesRecord;

  static ChildHierarchiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createChildHierarchiesRecordData({
  DocumentReference childRef,
  String childEmail,
  DocumentReference parentRef,
  String parentLeg,
}) =>
    serializers.toFirestore(
        ChildHierarchiesRecord.serializer,
        ChildHierarchiesRecord((c) => c
          ..childRef = childRef
          ..childEmail = childEmail
          ..parentRef = parentRef
          ..parentLeg = parentLeg));
