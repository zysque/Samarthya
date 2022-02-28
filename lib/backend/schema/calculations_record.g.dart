// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CalculationsRecord> _$calculationsRecordSerializer =
    new _$CalculationsRecordSerializer();

class _$CalculationsRecordSerializer
    implements StructuredSerializer<CalculationsRecord> {
  @override
  final Iterable<Type> types = const [CalculationsRecord, _$CalculationsRecord];
  @override
  final String wireName = 'CalculationsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CalculationsRecord object,
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
    value = object.directCommission;
    if (value != null) {
      result
        ..add('directCommission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.indirectCommission;
    if (value != null) {
      result
        ..add('indirectCommission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.emiDueAmount;
    if (value != null) {
      result
        ..add('emiDueAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.emiDueDate;
    if (value != null) {
      result
        ..add('emiDueDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.defaultPayments;
    if (value != null) {
      result
        ..add('defaultPayments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.comissionProcessed;
    if (value != null) {
      result
        ..add('comissionProcessed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.transCount;
    if (value != null) {
      result
        ..add('transCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  CalculationsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CalculationsRecordBuilder();

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
        case 'directCommission':
          result.directCommission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'indirectCommission':
          result.indirectCommission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'emiDueAmount':
          result.emiDueAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'emiDueDate':
          result.emiDueDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'defaultPayments':
          result.defaultPayments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'comissionProcessed':
          result.comissionProcessed = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'transCount':
          result.transCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$CalculationsRecord extends CalculationsRecord {
  @override
  final DocumentReference<Object> userRef;
  @override
  final double directCommission;
  @override
  final double indirectCommission;
  @override
  final double emiDueAmount;
  @override
  final DateTime emiDueDate;
  @override
  final int defaultPayments;
  @override
  final DateTime comissionProcessed;
  @override
  final int transCount;
  @override
  final String userCode;
  @override
  final DocumentReference<Object> reference;

  factory _$CalculationsRecord(
          [void Function(CalculationsRecordBuilder) updates]) =>
      (new CalculationsRecordBuilder()..update(updates)).build();

  _$CalculationsRecord._(
      {this.userRef,
      this.directCommission,
      this.indirectCommission,
      this.emiDueAmount,
      this.emiDueDate,
      this.defaultPayments,
      this.comissionProcessed,
      this.transCount,
      this.userCode,
      this.reference})
      : super._();

  @override
  CalculationsRecord rebuild(
          void Function(CalculationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CalculationsRecordBuilder toBuilder() =>
      new CalculationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalculationsRecord &&
        userRef == other.userRef &&
        directCommission == other.directCommission &&
        indirectCommission == other.indirectCommission &&
        emiDueAmount == other.emiDueAmount &&
        emiDueDate == other.emiDueDate &&
        defaultPayments == other.defaultPayments &&
        comissionProcessed == other.comissionProcessed &&
        transCount == other.transCount &&
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
                                    $jc($jc(0, userRef.hashCode),
                                        directCommission.hashCode),
                                    indirectCommission.hashCode),
                                emiDueAmount.hashCode),
                            emiDueDate.hashCode),
                        defaultPayments.hashCode),
                    comissionProcessed.hashCode),
                transCount.hashCode),
            userCode.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CalculationsRecord')
          ..add('userRef', userRef)
          ..add('directCommission', directCommission)
          ..add('indirectCommission', indirectCommission)
          ..add('emiDueAmount', emiDueAmount)
          ..add('emiDueDate', emiDueDate)
          ..add('defaultPayments', defaultPayments)
          ..add('comissionProcessed', comissionProcessed)
          ..add('transCount', transCount)
          ..add('userCode', userCode)
          ..add('reference', reference))
        .toString();
  }
}

class CalculationsRecordBuilder
    implements Builder<CalculationsRecord, CalculationsRecordBuilder> {
  _$CalculationsRecord _$v;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  double _directCommission;
  double get directCommission => _$this._directCommission;
  set directCommission(double directCommission) =>
      _$this._directCommission = directCommission;

  double _indirectCommission;
  double get indirectCommission => _$this._indirectCommission;
  set indirectCommission(double indirectCommission) =>
      _$this._indirectCommission = indirectCommission;

  double _emiDueAmount;
  double get emiDueAmount => _$this._emiDueAmount;
  set emiDueAmount(double emiDueAmount) => _$this._emiDueAmount = emiDueAmount;

  DateTime _emiDueDate;
  DateTime get emiDueDate => _$this._emiDueDate;
  set emiDueDate(DateTime emiDueDate) => _$this._emiDueDate = emiDueDate;

  int _defaultPayments;
  int get defaultPayments => _$this._defaultPayments;
  set defaultPayments(int defaultPayments) =>
      _$this._defaultPayments = defaultPayments;

  DateTime _comissionProcessed;
  DateTime get comissionProcessed => _$this._comissionProcessed;
  set comissionProcessed(DateTime comissionProcessed) =>
      _$this._comissionProcessed = comissionProcessed;

  int _transCount;
  int get transCount => _$this._transCount;
  set transCount(int transCount) => _$this._transCount = transCount;

  String _userCode;
  String get userCode => _$this._userCode;
  set userCode(String userCode) => _$this._userCode = userCode;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CalculationsRecordBuilder() {
    CalculationsRecord._initializeBuilder(this);
  }

  CalculationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _directCommission = $v.directCommission;
      _indirectCommission = $v.indirectCommission;
      _emiDueAmount = $v.emiDueAmount;
      _emiDueDate = $v.emiDueDate;
      _defaultPayments = $v.defaultPayments;
      _comissionProcessed = $v.comissionProcessed;
      _transCount = $v.transCount;
      _userCode = $v.userCode;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CalculationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CalculationsRecord;
  }

  @override
  void update(void Function(CalculationsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CalculationsRecord build() {
    final _$result = _$v ??
        new _$CalculationsRecord._(
            userRef: userRef,
            directCommission: directCommission,
            indirectCommission: indirectCommission,
            emiDueAmount: emiDueAmount,
            emiDueDate: emiDueDate,
            defaultPayments: defaultPayments,
            comissionProcessed: comissionProcessed,
            transCount: transCount,
            userCode: userCode,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
