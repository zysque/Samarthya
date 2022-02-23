// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_consts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdminConstsRecord> _$adminConstsRecordSerializer =
    new _$AdminConstsRecordSerializer();

class _$AdminConstsRecordSerializer
    implements StructuredSerializer<AdminConstsRecord> {
  @override
  final Iterable<Type> types = const [AdminConstsRecord, _$AdminConstsRecord];
  @override
  final String wireName = 'AdminConstsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AdminConstsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.directPer;
    if (value != null) {
      result
        ..add('directPer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.indirectPer;
    if (value != null) {
      result
        ..add('indirectPer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.adminUsers;
    if (value != null) {
      result
        ..add('adminUsers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.lastModified;
    if (value != null) {
      result
        ..add('lastModified')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.emiPaymentDay;
    if (value != null) {
      result
        ..add('emiPaymentDay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  AdminConstsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdminConstsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'directPer':
          result.directPer = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'indirectPer':
          result.indirectPer = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'adminUsers':
          result.adminUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'lastModified':
          result.lastModified = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'emiPaymentDay':
          result.emiPaymentDay = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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

class _$AdminConstsRecord extends AdminConstsRecord {
  @override
  final double directPer;
  @override
  final double indirectPer;
  @override
  final BuiltList<DocumentReference<Object>> adminUsers;
  @override
  final DateTime lastModified;
  @override
  final double emiPaymentDay;
  @override
  final DocumentReference<Object> reference;

  factory _$AdminConstsRecord(
          [void Function(AdminConstsRecordBuilder) updates]) =>
      (new AdminConstsRecordBuilder()..update(updates)).build();

  _$AdminConstsRecord._(
      {this.directPer,
      this.indirectPer,
      this.adminUsers,
      this.lastModified,
      this.emiPaymentDay,
      this.reference})
      : super._();

  @override
  AdminConstsRecord rebuild(void Function(AdminConstsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminConstsRecordBuilder toBuilder() =>
      new AdminConstsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminConstsRecord &&
        directPer == other.directPer &&
        indirectPer == other.indirectPer &&
        adminUsers == other.adminUsers &&
        lastModified == other.lastModified &&
        emiPaymentDay == other.emiPaymentDay &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, directPer.hashCode), indirectPer.hashCode),
                    adminUsers.hashCode),
                lastModified.hashCode),
            emiPaymentDay.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdminConstsRecord')
          ..add('directPer', directPer)
          ..add('indirectPer', indirectPer)
          ..add('adminUsers', adminUsers)
          ..add('lastModified', lastModified)
          ..add('emiPaymentDay', emiPaymentDay)
          ..add('reference', reference))
        .toString();
  }
}

class AdminConstsRecordBuilder
    implements Builder<AdminConstsRecord, AdminConstsRecordBuilder> {
  _$AdminConstsRecord _$v;

  double _directPer;
  double get directPer => _$this._directPer;
  set directPer(double directPer) => _$this._directPer = directPer;

  double _indirectPer;
  double get indirectPer => _$this._indirectPer;
  set indirectPer(double indirectPer) => _$this._indirectPer = indirectPer;

  ListBuilder<DocumentReference<Object>> _adminUsers;
  ListBuilder<DocumentReference<Object>> get adminUsers =>
      _$this._adminUsers ??= new ListBuilder<DocumentReference<Object>>();
  set adminUsers(ListBuilder<DocumentReference<Object>> adminUsers) =>
      _$this._adminUsers = adminUsers;

  DateTime _lastModified;
  DateTime get lastModified => _$this._lastModified;
  set lastModified(DateTime lastModified) =>
      _$this._lastModified = lastModified;

  double _emiPaymentDay;
  double get emiPaymentDay => _$this._emiPaymentDay;
  set emiPaymentDay(double emiPaymentDay) =>
      _$this._emiPaymentDay = emiPaymentDay;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AdminConstsRecordBuilder() {
    AdminConstsRecord._initializeBuilder(this);
  }

  AdminConstsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _directPer = $v.directPer;
      _indirectPer = $v.indirectPer;
      _adminUsers = $v.adminUsers?.toBuilder();
      _lastModified = $v.lastModified;
      _emiPaymentDay = $v.emiPaymentDay;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminConstsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdminConstsRecord;
  }

  @override
  void update(void Function(AdminConstsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AdminConstsRecord build() {
    _$AdminConstsRecord _$result;
    try {
      _$result = _$v ??
          new _$AdminConstsRecord._(
              directPer: directPer,
              indirectPer: indirectPer,
              adminUsers: _adminUsers?.build(),
              lastModified: lastModified,
              emiPaymentDay: emiPaymentDay,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'adminUsers';
        _adminUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AdminConstsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
