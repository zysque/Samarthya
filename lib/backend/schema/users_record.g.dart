// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userTitle;
    if (value != null) {
      result
        ..add('userTitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dob;
    if (value != null) {
      result
        ..add('dob')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aadharNumber;
    if (value != null) {
      result
        ..add('aadharNumber')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.panNumber;
    if (value != null) {
      result
        ..add('panNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aadharImage;
    if (value != null) {
      result
        ..add('aadharImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.panImage;
    if (value != null) {
      result
        ..add('panImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'userTitle':
          result.userTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dob':
          result.dob = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'aadharNumber':
          result.aadharNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'panNumber':
          result.panNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'aadharImage':
          result.aadharImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'panImage':
          result.panImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String uid;
  @override
  final LatLng location;
  @override
  final String phoneNumber;
  @override
  final String photoUrl;
  @override
  final DateTime createdTime;
  @override
  final String userTitle;
  @override
  final String address;
  @override
  final String dob;
  @override
  final int aadharNumber;
  @override
  final String panNumber;
  @override
  final String aadharImage;
  @override
  final String panImage;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.displayName,
      this.email,
      this.uid,
      this.location,
      this.phoneNumber,
      this.photoUrl,
      this.createdTime,
      this.userTitle,
      this.address,
      this.dob,
      this.aadharNumber,
      this.panNumber,
      this.aadharImage,
      this.panImage,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        displayName == other.displayName &&
        email == other.email &&
        uid == other.uid &&
        location == other.location &&
        phoneNumber == other.phoneNumber &&
        photoUrl == other.photoUrl &&
        createdTime == other.createdTime &&
        userTitle == other.userTitle &&
        address == other.address &&
        dob == other.dob &&
        aadharNumber == other.aadharNumber &&
        panNumber == other.panNumber &&
        aadharImage == other.aadharImage &&
        panImage == other.panImage &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                displayName
                                                                    .hashCode),
                                                            email.hashCode),
                                                        uid.hashCode),
                                                    location.hashCode),
                                                phoneNumber.hashCode),
                                            photoUrl.hashCode),
                                        createdTime.hashCode),
                                    userTitle.hashCode),
                                address.hashCode),
                            dob.hashCode),
                        aadharNumber.hashCode),
                    panNumber.hashCode),
                aadharImage.hashCode),
            panImage.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('displayName', displayName)
          ..add('email', email)
          ..add('uid', uid)
          ..add('location', location)
          ..add('phoneNumber', phoneNumber)
          ..add('photoUrl', photoUrl)
          ..add('createdTime', createdTime)
          ..add('userTitle', userTitle)
          ..add('address', address)
          ..add('dob', dob)
          ..add('aadharNumber', aadharNumber)
          ..add('panNumber', panNumber)
          ..add('aadharImage', aadharImage)
          ..add('panImage', panImage)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  LatLng _location;
  LatLng get location => _$this._location;
  set location(LatLng location) => _$this._location = location;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _userTitle;
  String get userTitle => _$this._userTitle;
  set userTitle(String userTitle) => _$this._userTitle = userTitle;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _dob;
  String get dob => _$this._dob;
  set dob(String dob) => _$this._dob = dob;

  int _aadharNumber;
  int get aadharNumber => _$this._aadharNumber;
  set aadharNumber(int aadharNumber) => _$this._aadharNumber = aadharNumber;

  String _panNumber;
  String get panNumber => _$this._panNumber;
  set panNumber(String panNumber) => _$this._panNumber = panNumber;

  String _aadharImage;
  String get aadharImage => _$this._aadharImage;
  set aadharImage(String aadharImage) => _$this._aadharImage = aadharImage;

  String _panImage;
  String get panImage => _$this._panImage;
  set panImage(String panImage) => _$this._panImage = panImage;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _email = $v.email;
      _uid = $v.uid;
      _location = $v.location;
      _phoneNumber = $v.phoneNumber;
      _photoUrl = $v.photoUrl;
      _createdTime = $v.createdTime;
      _userTitle = $v.userTitle;
      _address = $v.address;
      _dob = $v.dob;
      _aadharNumber = $v.aadharNumber;
      _panNumber = $v.panNumber;
      _aadharImage = $v.aadharImage;
      _panImage = $v.panImage;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            displayName: displayName,
            email: email,
            uid: uid,
            location: location,
            phoneNumber: phoneNumber,
            photoUrl: photoUrl,
            createdTime: createdTime,
            userTitle: userTitle,
            address: address,
            dob: dob,
            aadharNumber: aadharNumber,
            panNumber: panNumber,
            aadharImage: aadharImage,
            panImage: panImage,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
