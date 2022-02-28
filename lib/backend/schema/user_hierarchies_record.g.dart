// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hierarchies_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserHierarchiesRecord> _$userHierarchiesRecordSerializer =
    new _$UserHierarchiesRecordSerializer();

class _$UserHierarchiesRecordSerializer
    implements StructuredSerializer<UserHierarchiesRecord> {
  @override
  final Iterable<Type> types = const [
    UserHierarchiesRecord,
    _$UserHierarchiesRecord
  ];
  @override
  final String wireName = 'UserHierarchiesRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, UserHierarchiesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.hierarchyUser;
    if (value != null) {
      result
        ..add('hierarchyUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.referralParent;
    if (value != null) {
      result
        ..add('referralParent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.parentRef;
    if (value != null) {
      result
        ..add('parentRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.leftChildRef;
    if (value != null) {
      result
        ..add('leftChildRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.rightChildRef;
    if (value != null) {
      result
        ..add('rightChildRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.hasParent;
    if (value != null) {
      result
        ..add('hasParent')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasLeft;
    if (value != null) {
      result
        ..add('hasLeft')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasRight;
    if (value != null) {
      result
        ..add('hasRight')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasReferral;
    if (value != null) {
      result
        ..add('hasReferral')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  UserHierarchiesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserHierarchiesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'hierarchyUser':
          result.hierarchyUser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'referralParent':
          result.referralParent = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'parentRef':
          result.parentRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'leftChildRef':
          result.leftChildRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'rightChildRef':
          result.rightChildRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'hasParent':
          result.hasParent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'hasLeft':
          result.hasLeft = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'hasRight':
          result.hasRight = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'hasReferral':
          result.hasReferral = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$UserHierarchiesRecord extends UserHierarchiesRecord {
  @override
  final DocumentReference<Object> hierarchyUser;
  @override
  final DocumentReference<Object> referralParent;
  @override
  final DocumentReference<Object> parentRef;
  @override
  final DocumentReference<Object> leftChildRef;
  @override
  final DocumentReference<Object> rightChildRef;
  @override
  final bool hasParent;
  @override
  final bool hasLeft;
  @override
  final bool hasRight;
  @override
  final bool hasReferral;
  @override
  final String userCode;
  @override
  final DocumentReference<Object> reference;

  factory _$UserHierarchiesRecord(
          [void Function(UserHierarchiesRecordBuilder) updates]) =>
      (new UserHierarchiesRecordBuilder()..update(updates)).build();

  _$UserHierarchiesRecord._(
      {this.hierarchyUser,
      this.referralParent,
      this.parentRef,
      this.leftChildRef,
      this.rightChildRef,
      this.hasParent,
      this.hasLeft,
      this.hasRight,
      this.hasReferral,
      this.userCode,
      this.reference})
      : super._();

  @override
  UserHierarchiesRecord rebuild(
          void Function(UserHierarchiesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserHierarchiesRecordBuilder toBuilder() =>
      new UserHierarchiesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserHierarchiesRecord &&
        hierarchyUser == other.hierarchyUser &&
        referralParent == other.referralParent &&
        parentRef == other.parentRef &&
        leftChildRef == other.leftChildRef &&
        rightChildRef == other.rightChildRef &&
        hasParent == other.hasParent &&
        hasLeft == other.hasLeft &&
        hasRight == other.hasRight &&
        hasReferral == other.hasReferral &&
        userCode == other.userCode &&
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
                                        $jc($jc(0, hierarchyUser.hashCode),
                                            referralParent.hashCode),
                                        parentRef.hashCode),
                                    leftChildRef.hashCode),
                                rightChildRef.hashCode),
                            hasParent.hashCode),
                        hasLeft.hashCode),
                    hasRight.hashCode),
                hasReferral.hashCode),
            userCode.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserHierarchiesRecord')
          ..add('hierarchyUser', hierarchyUser)
          ..add('referralParent', referralParent)
          ..add('parentRef', parentRef)
          ..add('leftChildRef', leftChildRef)
          ..add('rightChildRef', rightChildRef)
          ..add('hasParent', hasParent)
          ..add('hasLeft', hasLeft)
          ..add('hasRight', hasRight)
          ..add('hasReferral', hasReferral)
          ..add('userCode', userCode)
          ..add('reference', reference))
        .toString();
  }
}

class UserHierarchiesRecordBuilder
    implements Builder<UserHierarchiesRecord, UserHierarchiesRecordBuilder> {
  _$UserHierarchiesRecord _$v;

  DocumentReference<Object> _hierarchyUser;
  DocumentReference<Object> get hierarchyUser => _$this._hierarchyUser;
  set hierarchyUser(DocumentReference<Object> hierarchyUser) =>
      _$this._hierarchyUser = hierarchyUser;

  DocumentReference<Object> _referralParent;
  DocumentReference<Object> get referralParent => _$this._referralParent;
  set referralParent(DocumentReference<Object> referralParent) =>
      _$this._referralParent = referralParent;

  DocumentReference<Object> _parentRef;
  DocumentReference<Object> get parentRef => _$this._parentRef;
  set parentRef(DocumentReference<Object> parentRef) =>
      _$this._parentRef = parentRef;

  DocumentReference<Object> _leftChildRef;
  DocumentReference<Object> get leftChildRef => _$this._leftChildRef;
  set leftChildRef(DocumentReference<Object> leftChildRef) =>
      _$this._leftChildRef = leftChildRef;

  DocumentReference<Object> _rightChildRef;
  DocumentReference<Object> get rightChildRef => _$this._rightChildRef;
  set rightChildRef(DocumentReference<Object> rightChildRef) =>
      _$this._rightChildRef = rightChildRef;

  bool _hasParent;
  bool get hasParent => _$this._hasParent;
  set hasParent(bool hasParent) => _$this._hasParent = hasParent;

  bool _hasLeft;
  bool get hasLeft => _$this._hasLeft;
  set hasLeft(bool hasLeft) => _$this._hasLeft = hasLeft;

  bool _hasRight;
  bool get hasRight => _$this._hasRight;
  set hasRight(bool hasRight) => _$this._hasRight = hasRight;

  bool _hasReferral;
  bool get hasReferral => _$this._hasReferral;
  set hasReferral(bool hasReferral) => _$this._hasReferral = hasReferral;

  String _userCode;
  String get userCode => _$this._userCode;
  set userCode(String userCode) => _$this._userCode = userCode;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UserHierarchiesRecordBuilder() {
    UserHierarchiesRecord._initializeBuilder(this);
  }

  UserHierarchiesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hierarchyUser = $v.hierarchyUser;
      _referralParent = $v.referralParent;
      _parentRef = $v.parentRef;
      _leftChildRef = $v.leftChildRef;
      _rightChildRef = $v.rightChildRef;
      _hasParent = $v.hasParent;
      _hasLeft = $v.hasLeft;
      _hasRight = $v.hasRight;
      _hasReferral = $v.hasReferral;
      _userCode = $v.userCode;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserHierarchiesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserHierarchiesRecord;
  }

  @override
  void update(void Function(UserHierarchiesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserHierarchiesRecord build() {
    final _$result = _$v ??
        new _$UserHierarchiesRecord._(
            hierarchyUser: hierarchyUser,
            referralParent: referralParent,
            parentRef: parentRef,
            leftChildRef: leftChildRef,
            rightChildRef: rightChildRef,
            hasParent: hasParent,
            hasLeft: hasLeft,
            hasRight: hasRight,
            hasReferral: hasReferral,
            userCode: userCode,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
