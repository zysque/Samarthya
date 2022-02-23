import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get email;

  @nullable
  String get uid;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get userTitle;

  @nullable
  String get address;

  @nullable
  String get dob;

  @nullable
  int get aadharNumber;

  @nullable
  String get panNumber;

  @nullable
  String get aadharImage;

  @nullable
  String get panImage;

  @nullable
  String get userCode;

  @nullable
  bool get incomplete;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..displayName = ''
    ..email = ''
    ..uid = ''
    ..phoneNumber = ''
    ..photoUrl = ''
    ..userTitle = ''
    ..address = ''
    ..dob = ''
    ..aadharNumber = 0
    ..panNumber = ''
    ..aadharImage = ''
    ..panImage = ''
    ..userCode = ''
    ..incomplete = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String displayName,
  String email,
  String uid,
  LatLng location,
  String phoneNumber,
  String photoUrl,
  DateTime createdTime,
  String userTitle,
  String address,
  String dob,
  int aadharNumber,
  String panNumber,
  String aadharImage,
  String panImage,
  String userCode,
  bool incomplete,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..displayName = displayName
          ..email = email
          ..uid = uid
          ..location = location
          ..phoneNumber = phoneNumber
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..userTitle = userTitle
          ..address = address
          ..dob = dob
          ..aadharNumber = aadharNumber
          ..panNumber = panNumber
          ..aadharImage = aadharImage
          ..panImage = panImage
          ..userCode = userCode
          ..incomplete = incomplete));
