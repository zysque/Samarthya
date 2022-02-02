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
  DocumentReference get referralParent;

  @nullable
  DocumentReference get parentRef;

  @nullable
  DocumentReference get leftChildRef;

  @nullable
  DocumentReference get rightChildRef;

  @nullable
  bool get hasParent;

  @nullable
  bool get hasLeft;

  @nullable
  bool get hasRight;

  @nullable
  String get hierarchyUserEmail;

  @nullable
  bool get hasReferral;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserHierarchiesRecordBuilder builder) =>
      builder
        ..hasParent = false
        ..hasLeft = false
        ..hasRight = false
        ..hierarchyUserEmail = ''
        ..hasReferral = false;

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
  DocumentReference referralParent,
  DocumentReference parentRef,
  DocumentReference leftChildRef,
  DocumentReference rightChildRef,
  bool hasParent,
  bool hasLeft,
  bool hasRight,
  String hierarchyUserEmail,
  bool hasReferral,
}) =>
    serializers.toFirestore(
        UserHierarchiesRecord.serializer,
        UserHierarchiesRecord((u) => u
          ..hierarchyUser = hierarchyUser
          ..referralParent = referralParent
          ..parentRef = parentRef
          ..leftChildRef = leftChildRef
          ..rightChildRef = rightChildRef
          ..hasParent = hasParent
          ..hasLeft = hasLeft
          ..hasRight = hasRight
          ..hierarchyUserEmail = hierarchyUserEmail
          ..hasReferral = hasReferral));
