// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delinked_users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DelinkedUsersRecord> _$delinkedUsersRecordSerializer =
    new _$DelinkedUsersRecordSerializer();

class _$DelinkedUsersRecordSerializer
    implements StructuredSerializer<DelinkedUsersRecord> {
  @override
  final Iterable<Type> types = const [
    DelinkedUsersRecord,
    _$DelinkedUsersRecord
  ];
  @override
  final String wireName = 'DelinkedUsersRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DelinkedUsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.userCode;
    if (value != null) {
      result
        ..add('userCode')
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
  DelinkedUsersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DelinkedUsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'userRef':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'userCode':
          result.userCode = serializers.deserialize(value,
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

class _$DelinkedUsersRecord extends DelinkedUsersRecord {
  @override
  final DocumentReference<Object> userRef;
  @override
  final String userCode;
  @override
  final DocumentReference<Object> reference;

  factory _$DelinkedUsersRecord(
          [void Function(DelinkedUsersRecordBuilder) updates]) =>
      (new DelinkedUsersRecordBuilder()..update(updates)).build();

  _$DelinkedUsersRecord._({this.userRef, this.userCode, this.reference})
      : super._();

  @override
  DelinkedUsersRecord rebuild(
          void Function(DelinkedUsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DelinkedUsersRecordBuilder toBuilder() =>
      new DelinkedUsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DelinkedUsersRecord &&
        userRef == other.userRef &&
        userCode == other.userCode &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, userRef.hashCode), userCode.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DelinkedUsersRecord')
          ..add('userRef', userRef)
          ..add('userCode', userCode)
          ..add('reference', reference))
        .toString();
  }
}

class DelinkedUsersRecordBuilder
    implements Builder<DelinkedUsersRecord, DelinkedUsersRecordBuilder> {
  _$DelinkedUsersRecord _$v;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  String _userCode;
  String get userCode => _$this._userCode;
  set userCode(String userCode) => _$this._userCode = userCode;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DelinkedUsersRecordBuilder() {
    DelinkedUsersRecord._initializeBuilder(this);
  }

  DelinkedUsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _userCode = $v.userCode;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DelinkedUsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DelinkedUsersRecord;
  }

  @override
  void update(void Function(DelinkedUsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DelinkedUsersRecord build() {
    final _$result = _$v ??
        new _$DelinkedUsersRecord._(
            userRef: userRef, userCode: userCode, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
