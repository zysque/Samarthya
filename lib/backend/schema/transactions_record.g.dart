// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionsRecord> _$transactionsRecordSerializer =
    new _$TransactionsRecordSerializer();

class _$TransactionsRecordSerializer
    implements StructuredSerializer<TransactionsRecord> {
  @override
  final Iterable<Type> types = const [TransactionsRecord, _$TransactionsRecord];
  @override
  final String wireName = 'TransactionsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TransactionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.transactionUser;
    if (value != null) {
      result
        ..add('transactionUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.transactionAmount;
    if (value != null) {
      result
        ..add('transactionAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.transactionType;
    if (value != null) {
      result
        ..add('transactionType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('bookingRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.commissionRef;
    if (value != null) {
      result
        ..add('commissionRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.mode;
    if (value != null) {
      result
        ..add('mode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionTime;
    if (value != null) {
      result
        ..add('transactionTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  TransactionsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'transactionUser':
          result.transactionUser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'transactionAmount':
          result.transactionAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'transactionType':
          result.transactionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bookingRef':
          result.bookingRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'commissionRef':
          result.commissionRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'mode':
          result.mode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transactionTime':
          result.transactionTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$TransactionsRecord extends TransactionsRecord {
  @override
  final DocumentReference<Object> transactionUser;
  @override
  final double transactionAmount;
  @override
  final String transactionType;
  @override
  final DocumentReference<Object> bookingRef;
  @override
  final DocumentReference<Object> commissionRef;
  @override
  final String mode;
  @override
  final DateTime transactionTime;
  @override
  final bool status;
  @override
  final DocumentReference<Object> reference;

  factory _$TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =>
      (new TransactionsRecordBuilder()..update(updates)).build();

  _$TransactionsRecord._(
      {this.transactionUser,
      this.transactionAmount,
      this.transactionType,
      this.bookingRef,
      this.commissionRef,
      this.mode,
      this.transactionTime,
      this.status,
      this.reference})
      : super._();

  @override
  TransactionsRecord rebuild(
          void Function(TransactionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionsRecordBuilder toBuilder() =>
      new TransactionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionsRecord &&
        transactionUser == other.transactionUser &&
        transactionAmount == other.transactionAmount &&
        transactionType == other.transactionType &&
        bookingRef == other.bookingRef &&
        commissionRef == other.commissionRef &&
        mode == other.mode &&
        transactionTime == other.transactionTime &&
        status == other.status &&
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
                                $jc($jc(0, transactionUser.hashCode),
                                    transactionAmount.hashCode),
                                transactionType.hashCode),
                            bookingRef.hashCode),
                        commissionRef.hashCode),
                    mode.hashCode),
                transactionTime.hashCode),
            status.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionsRecord')
          ..add('transactionUser', transactionUser)
          ..add('transactionAmount', transactionAmount)
          ..add('transactionType', transactionType)
          ..add('bookingRef', bookingRef)
          ..add('commissionRef', commissionRef)
          ..add('mode', mode)
          ..add('transactionTime', transactionTime)
          ..add('status', status)
          ..add('reference', reference))
        .toString();
  }
}

class TransactionsRecordBuilder
    implements Builder<TransactionsRecord, TransactionsRecordBuilder> {
  _$TransactionsRecord _$v;

  DocumentReference<Object> _transactionUser;
  DocumentReference<Object> get transactionUser => _$this._transactionUser;
  set transactionUser(DocumentReference<Object> transactionUser) =>
      _$this._transactionUser = transactionUser;

  double _transactionAmount;
  double get transactionAmount => _$this._transactionAmount;
  set transactionAmount(double transactionAmount) =>
      _$this._transactionAmount = transactionAmount;

  String _transactionType;
  String get transactionType => _$this._transactionType;
  set transactionType(String transactionType) =>
      _$this._transactionType = transactionType;

  DocumentReference<Object> _bookingRef;
  DocumentReference<Object> get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object> bookingRef) =>
      _$this._bookingRef = bookingRef;

  DocumentReference<Object> _commissionRef;
  DocumentReference<Object> get commissionRef => _$this._commissionRef;
  set commissionRef(DocumentReference<Object> commissionRef) =>
      _$this._commissionRef = commissionRef;

  String _mode;
  String get mode => _$this._mode;
  set mode(String mode) => _$this._mode = mode;

  DateTime _transactionTime;
  DateTime get transactionTime => _$this._transactionTime;
  set transactionTime(DateTime transactionTime) =>
      _$this._transactionTime = transactionTime;

  bool _status;
  bool get status => _$this._status;
  set status(bool status) => _$this._status = status;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TransactionsRecordBuilder() {
    TransactionsRecord._initializeBuilder(this);
  }

  TransactionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionUser = $v.transactionUser;
      _transactionAmount = $v.transactionAmount;
      _transactionType = $v.transactionType;
      _bookingRef = $v.bookingRef;
      _commissionRef = $v.commissionRef;
      _mode = $v.mode;
      _transactionTime = $v.transactionTime;
      _status = $v.status;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionsRecord;
  }

  @override
  void update(void Function(TransactionsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionsRecord build() {
    final _$result = _$v ??
        new _$TransactionsRecord._(
            transactionUser: transactionUser,
            transactionAmount: transactionAmount,
            transactionType: transactionType,
            bookingRef: bookingRef,
            commissionRef: commissionRef,
            mode: mode,
            transactionTime: transactionTime,
            status: status,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
