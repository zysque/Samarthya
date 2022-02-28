// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_and_rates_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlansAndRatesRecord> _$plansAndRatesRecordSerializer =
    new _$PlansAndRatesRecordSerializer();

class _$PlansAndRatesRecordSerializer
    implements StructuredSerializer<PlansAndRatesRecord> {
  @override
  final Iterable<Type> types = const [
    PlansAndRatesRecord,
    _$PlansAndRatesRecord
  ];
  @override
  final String wireName = 'PlansAndRatesRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PlansAndRatesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.phaseCode;
    if (value != null) {
      result
        ..add('phaseCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fixedRatePerSqFt;
    if (value != null) {
      result
        ..add('fixedRatePerSqFt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minBookingAmtPerc;
    if (value != null) {
      result
        ..add('minBookingAmtPerc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.emiTenureOptions;
    if (value != null) {
      result
        ..add('emiTenureOptions')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.paymentDaysAllowed;
    if (value != null) {
      result
        ..add('paymentDaysAllowed')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.projectRef;
    if (value != null) {
      result
        ..add('projectRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.created;
    if (value != null) {
      result
        ..add('created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastModified;
    if (value != null) {
      result
        ..add('lastModified')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.plotsAvailable;
    if (value != null) {
      result
        ..add('plotsAvailable')
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
  PlansAndRatesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlansAndRatesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'phaseCode':
          result.phaseCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fixedRatePerSqFt':
          result.fixedRatePerSqFt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'minBookingAmtPerc':
          result.minBookingAmtPerc = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'emiTenureOptions':
          result.emiTenureOptions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'paymentDaysAllowed':
          result.paymentDaysAllowed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'projectRef':
          result.projectRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'lastModified':
          result.lastModified = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'plotsAvailable':
          result.plotsAvailable.replace(serializers.deserialize(value,
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

class _$PlansAndRatesRecord extends PlansAndRatesRecord {
  @override
  final String phaseCode;
  @override
  final int fixedRatePerSqFt;
  @override
  final double minBookingAmtPerc;
  @override
  final BuiltList<String> emiTenureOptions;
  @override
  final int paymentDaysAllowed;
  @override
  final DocumentReference<Object> projectRef;
  @override
  final DateTime created;
  @override
  final DateTime lastModified;
  @override
  final BuiltList<String> plotsAvailable;
  @override
  final DocumentReference<Object> reference;

  factory _$PlansAndRatesRecord(
          [void Function(PlansAndRatesRecordBuilder) updates]) =>
      (new PlansAndRatesRecordBuilder()..update(updates)).build();

  _$PlansAndRatesRecord._(
      {this.phaseCode,
      this.fixedRatePerSqFt,
      this.minBookingAmtPerc,
      this.emiTenureOptions,
      this.paymentDaysAllowed,
      this.projectRef,
      this.created,
      this.lastModified,
      this.plotsAvailable,
      this.reference})
      : super._();

  @override
  PlansAndRatesRecord rebuild(
          void Function(PlansAndRatesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlansAndRatesRecordBuilder toBuilder() =>
      new PlansAndRatesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlansAndRatesRecord &&
        phaseCode == other.phaseCode &&
        fixedRatePerSqFt == other.fixedRatePerSqFt &&
        minBookingAmtPerc == other.minBookingAmtPerc &&
        emiTenureOptions == other.emiTenureOptions &&
        paymentDaysAllowed == other.paymentDaysAllowed &&
        projectRef == other.projectRef &&
        created == other.created &&
        lastModified == other.lastModified &&
        plotsAvailable == other.plotsAvailable &&
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
                                    $jc($jc(0, phaseCode.hashCode),
                                        fixedRatePerSqFt.hashCode),
                                    minBookingAmtPerc.hashCode),
                                emiTenureOptions.hashCode),
                            paymentDaysAllowed.hashCode),
                        projectRef.hashCode),
                    created.hashCode),
                lastModified.hashCode),
            plotsAvailable.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlansAndRatesRecord')
          ..add('phaseCode', phaseCode)
          ..add('fixedRatePerSqFt', fixedRatePerSqFt)
          ..add('minBookingAmtPerc', minBookingAmtPerc)
          ..add('emiTenureOptions', emiTenureOptions)
          ..add('paymentDaysAllowed', paymentDaysAllowed)
          ..add('projectRef', projectRef)
          ..add('created', created)
          ..add('lastModified', lastModified)
          ..add('plotsAvailable', plotsAvailable)
          ..add('reference', reference))
        .toString();
  }
}

class PlansAndRatesRecordBuilder
    implements Builder<PlansAndRatesRecord, PlansAndRatesRecordBuilder> {
  _$PlansAndRatesRecord _$v;

  String _phaseCode;
  String get phaseCode => _$this._phaseCode;
  set phaseCode(String phaseCode) => _$this._phaseCode = phaseCode;

  int _fixedRatePerSqFt;
  int get fixedRatePerSqFt => _$this._fixedRatePerSqFt;
  set fixedRatePerSqFt(int fixedRatePerSqFt) =>
      _$this._fixedRatePerSqFt = fixedRatePerSqFt;

  double _minBookingAmtPerc;
  double get minBookingAmtPerc => _$this._minBookingAmtPerc;
  set minBookingAmtPerc(double minBookingAmtPerc) =>
      _$this._minBookingAmtPerc = minBookingAmtPerc;

  ListBuilder<String> _emiTenureOptions;
  ListBuilder<String> get emiTenureOptions =>
      _$this._emiTenureOptions ??= new ListBuilder<String>();
  set emiTenureOptions(ListBuilder<String> emiTenureOptions) =>
      _$this._emiTenureOptions = emiTenureOptions;

  int _paymentDaysAllowed;
  int get paymentDaysAllowed => _$this._paymentDaysAllowed;
  set paymentDaysAllowed(int paymentDaysAllowed) =>
      _$this._paymentDaysAllowed = paymentDaysAllowed;

  DocumentReference<Object> _projectRef;
  DocumentReference<Object> get projectRef => _$this._projectRef;
  set projectRef(DocumentReference<Object> projectRef) =>
      _$this._projectRef = projectRef;

  DateTime _created;
  DateTime get created => _$this._created;
  set created(DateTime created) => _$this._created = created;

  DateTime _lastModified;
  DateTime get lastModified => _$this._lastModified;
  set lastModified(DateTime lastModified) =>
      _$this._lastModified = lastModified;

  ListBuilder<String> _plotsAvailable;
  ListBuilder<String> get plotsAvailable =>
      _$this._plotsAvailable ??= new ListBuilder<String>();
  set plotsAvailable(ListBuilder<String> plotsAvailable) =>
      _$this._plotsAvailable = plotsAvailable;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PlansAndRatesRecordBuilder() {
    PlansAndRatesRecord._initializeBuilder(this);
  }

  PlansAndRatesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phaseCode = $v.phaseCode;
      _fixedRatePerSqFt = $v.fixedRatePerSqFt;
      _minBookingAmtPerc = $v.minBookingAmtPerc;
      _emiTenureOptions = $v.emiTenureOptions?.toBuilder();
      _paymentDaysAllowed = $v.paymentDaysAllowed;
      _projectRef = $v.projectRef;
      _created = $v.created;
      _lastModified = $v.lastModified;
      _plotsAvailable = $v.plotsAvailable?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlansAndRatesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlansAndRatesRecord;
  }

  @override
  void update(void Function(PlansAndRatesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlansAndRatesRecord build() {
    _$PlansAndRatesRecord _$result;
    try {
      _$result = _$v ??
          new _$PlansAndRatesRecord._(
              phaseCode: phaseCode,
              fixedRatePerSqFt: fixedRatePerSqFt,
              minBookingAmtPerc: minBookingAmtPerc,
              emiTenureOptions: _emiTenureOptions?.build(),
              paymentDaysAllowed: paymentDaysAllowed,
              projectRef: projectRef,
              created: created,
              lastModified: lastModified,
              plotsAvailable: _plotsAvailable?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'emiTenureOptions';
        _emiTenureOptions?.build();

        _$failedField = 'plotsAvailable';
        _plotsAvailable?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PlansAndRatesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
