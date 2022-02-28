// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commissions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommissionsRecord> _$commissionsRecordSerializer =
    new _$CommissionsRecordSerializer();

class _$CommissionsRecordSerializer
    implements StructuredSerializer<CommissionsRecord> {
  @override
  final Iterable<Type> types = const [CommissionsRecord, _$CommissionsRecord];
  @override
  final String wireName = 'CommissionsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CommissionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.commissionUser;
    if (value != null) {
      result
        ..add('commissionUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.commissionAmount;
    if (value != null) {
      result
        ..add('commissionAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.isDirect;
    if (value != null) {
      result
        ..add('isDirect')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('bookingRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.lastModified;
    if (value != null) {
      result
        ..add('lastModified')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.unsettledAmount;
    if (value != null) {
      result
        ..add('unsettledAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.settled;
    if (value != null) {
      result
        ..add('settled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  CommissionsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommissionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'commissionUser':
          result.commissionUser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'commissionAmount':
          result.commissionAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'isDirect':
          result.isDirect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'bookingRef':
          result.bookingRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'lastModified':
          result.lastModified = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'unsettledAmount':
          result.unsettledAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'settled':
          result.settled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$CommissionsRecord extends CommissionsRecord {
  @override
  final DocumentReference<Object> commissionUser;
  @override
  final double commissionAmount;
  @override
  final bool isDirect;
  @override
  final DocumentReference<Object> bookingRef;
  @override
  final DateTime lastModified;
  @override
  final double unsettledAmount;
  @override
  final bool settled;
  @override
  final BuiltList<String> comments;
  @override
  final DocumentReference<Object> reference;

  factory _$CommissionsRecord(
          [void Function(CommissionsRecordBuilder) updates]) =>
      (new CommissionsRecordBuilder()..update(updates)).build();

  _$CommissionsRecord._(
      {this.commissionUser,
      this.commissionAmount,
      this.isDirect,
      this.bookingRef,
      this.lastModified,
      this.unsettledAmount,
      this.settled,
      this.comments,
      this.reference})
      : super._();

  @override
  CommissionsRecord rebuild(void Function(CommissionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommissionsRecordBuilder toBuilder() =>
      new CommissionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommissionsRecord &&
        commissionUser == other.commissionUser &&
        commissionAmount == other.commissionAmount &&
        isDirect == other.isDirect &&
        bookingRef == other.bookingRef &&
        lastModified == other.lastModified &&
        unsettledAmount == other.unsettledAmount &&
        settled == other.settled &&
        comments == other.comments &&
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
                                $jc($jc(0, commissionUser.hashCode),
                                    commissionAmount.hashCode),
                                isDirect.hashCode),
                            bookingRef.hashCode),
                        lastModified.hashCode),
                    unsettledAmount.hashCode),
                settled.hashCode),
            comments.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommissionsRecord')
          ..add('commissionUser', commissionUser)
          ..add('commissionAmount', commissionAmount)
          ..add('isDirect', isDirect)
          ..add('bookingRef', bookingRef)
          ..add('lastModified', lastModified)
          ..add('unsettledAmount', unsettledAmount)
          ..add('settled', settled)
          ..add('comments', comments)
          ..add('reference', reference))
        .toString();
  }
}

class CommissionsRecordBuilder
    implements Builder<CommissionsRecord, CommissionsRecordBuilder> {
  _$CommissionsRecord _$v;

  DocumentReference<Object> _commissionUser;
  DocumentReference<Object> get commissionUser => _$this._commissionUser;
  set commissionUser(DocumentReference<Object> commissionUser) =>
      _$this._commissionUser = commissionUser;

  double _commissionAmount;
  double get commissionAmount => _$this._commissionAmount;
  set commissionAmount(double commissionAmount) =>
      _$this._commissionAmount = commissionAmount;

  bool _isDirect;
  bool get isDirect => _$this._isDirect;
  set isDirect(bool isDirect) => _$this._isDirect = isDirect;

  DocumentReference<Object> _bookingRef;
  DocumentReference<Object> get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object> bookingRef) =>
      _$this._bookingRef = bookingRef;

  DateTime _lastModified;
  DateTime get lastModified => _$this._lastModified;
  set lastModified(DateTime lastModified) =>
      _$this._lastModified = lastModified;

  double _unsettledAmount;
  double get unsettledAmount => _$this._unsettledAmount;
  set unsettledAmount(double unsettledAmount) =>
      _$this._unsettledAmount = unsettledAmount;

  bool _settled;
  bool get settled => _$this._settled;
  set settled(bool settled) => _$this._settled = settled;

  ListBuilder<String> _comments;
  ListBuilder<String> get comments =>
      _$this._comments ??= new ListBuilder<String>();
  set comments(ListBuilder<String> comments) => _$this._comments = comments;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CommissionsRecordBuilder() {
    CommissionsRecord._initializeBuilder(this);
  }

  CommissionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _commissionUser = $v.commissionUser;
      _commissionAmount = $v.commissionAmount;
      _isDirect = $v.isDirect;
      _bookingRef = $v.bookingRef;
      _lastModified = $v.lastModified;
      _unsettledAmount = $v.unsettledAmount;
      _settled = $v.settled;
      _comments = $v.comments?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommissionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommissionsRecord;
  }

  @override
  void update(void Function(CommissionsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommissionsRecord build() {
    _$CommissionsRecord _$result;
    try {
      _$result = _$v ??
          new _$CommissionsRecord._(
              commissionUser: commissionUser,
              commissionAmount: commissionAmount,
              isDirect: isDirect,
              bookingRef: bookingRef,
              lastModified: lastModified,
              unsettledAmount: unsettledAmount,
              settled: settled,
              comments: _comments?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'comments';
        _comments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CommissionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
