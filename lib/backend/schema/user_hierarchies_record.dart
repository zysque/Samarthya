import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_hierarchies_record.g.dart';

abstract class UserHierarchiesRecord
    implements Built<UserHierarchiesRecord, UserHierarchiesRecordBuilder> {
  static Serializer<UserHierarchiesRecord> get serializer =>
      _$userHierarchiesRecordSerializer;

  @nullable
  DocumentReference get hierarchyUser;

  @nullable
  String get userEmail;

  @nullable
  String get parentEmail;

  @nullable
  BuiltList<DocumentReference> get hierarchicalParents;

  @nullable
  bool get hasLeft;

  @nullable
  bool get hasRight;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserHierarchiesRecordBuilder builder) =>
      builder
        ..userEmail = ''
        ..parentEmail = ''
        ..hierarchicalParents = ListBuilder()
        ..hasLeft = false
        ..hasRight = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userHierarchies');

  static Stream<UserHierarchiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserHierarchiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserHierarchiesRecord._();
  factory UserHierarchiesRecord(
          [void Function(UserHierarchiesRecordBuilder) updates]) =
      _$UserHierarchiesRecord;

  static UserHierarchiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserHierarchiesRecordData({
  DocumentReference hierarchyUser,
  String userEmail,
  String parentEmail,
  bool hasLeft,
  bool hasRight,
}) =>
    serializers.toFirestore(
        UserHierarchiesRecord.serializer,
        UserHierarchiesRecord((u) => u
          ..hierarchyUser = hierarchyUser
          ..userEmail = userEmail
          ..parentEmail = parentEmail
          ..hierarchicalParents = null
          ..hasLeft = hasLeft
          ..hasRight = hasRight));
