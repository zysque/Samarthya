// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingsRecord> _$bookingsRecordSerializer =
    new _$BookingsRecordSerializer();

class _$BookingsRecordSerializer
    implements StructuredSerializer<BookingsRecord> {
  @override
  final Iterable<Type> types = const [BookingsRecord, _$BookingsRecord];
  @override
  final String wireName = 'BookingsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BookingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.projectRef;
    if (value != null) {
      result
        ..add('projectRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.planRef;
    if (value != null) {
      result
        ..add('planRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.buyerRef;
    if (value != null) {
      result
        ..add('buyerRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.totalAmountToPay;
    if (value != null) {
      result
        ..add('totalAmountToPay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.areaBookedInSqft;
    if (value != null) {
      result
        ..add('areaBookedInSqft')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.bookingAmount;
    if (value != null) {
      result
        ..add('bookingAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.downPayment;
    if (value != null) {
      result
        ..add('downPayment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.emiAmount;
    if (value != null) {
      result
        ..add('emiAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.emiTenureInMonths;
    if (value != null) {
      result
        ..add('emiTenureInMonths')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.created;
    if (value != null) {
      result
        ..add('created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isApproved;
    if (value != null) {
      result
        ..add('isApproved')
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
    value = object.amountLeftToPay;
    if (value != null) {
      result
        ..add('amountLeftToPay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lastModified;
    if (value != null) {
      result
        ..add('lastModified')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.creditStatus;
    if (value != null) {
      result
        ..add('creditStatus')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dueAmount;
    if (value != null) {
      result
        ..add('dueAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.dueDate;
    if (value != null) {
      result
        ..add('dueDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  BookingsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'projectRef':
          result.projectRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'planRef':
          result.planRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'buyerRef':
          result.buyerRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'totalAmountToPay':
          result.totalAmountToPay = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'areaBookedInSqft':
          result.areaBookedInSqft = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bookingAmount':
          result.bookingAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'downPayment':
          result.downPayment = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'emiAmount':
          result.emiAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'emiTenureInMonths':
          result.emiTenureInMonths = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isApproved':
          result.isApproved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'amountLeftToPay':
          result.amountLeftToPay = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'lastModified':
          result.lastModified = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'creditStatus':
          result.creditStatus = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'dueAmount':
          result.dueAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'dueDate':
          result.dueDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$BookingsRecord extends BookingsRecord {
  @override
  final DocumentReference<Object> projectRef;
  @override
  final DocumentReference<Object> planRef;
  @override
  final DocumentReference<Object> buyerRef;
  @override
  final double totalAmountToPay;
  @override
  final int areaBookedInSqft;
  @override
  final double bookingAmount;
  @override
  final double downPayment;
  @override
  final double emiAmount;
  @override
  final int emiTenureInMonths;
  @override
  final DateTime created;
  @override
  final bool isApproved;
  @override
  final BuiltList<String> comments;
  @override
  final double amountLeftToPay;
  @override
  final DateTime lastModified;
  @override
  final bool creditStatus;
  @override
  final double dueAmount;
  @override
  final DateTime dueDate;
  @override
  final DocumentReference<Object> reference;

  factory _$BookingsRecord([void Function(BookingsRecordBuilder) updates]) =>
      (new BookingsRecordBuilder()..update(updates)).build();

  _$BookingsRecord._(
      {this.projectRef,
      this.planRef,
      this.buyerRef,
      this.totalAmountToPay,
      this.areaBookedInSqft,
      this.bookingAmount,
      this.downPayment,
      this.emiAmount,
      this.emiTenureInMonths,
      this.created,
      this.isApproved,
      this.comments,
      this.amountLeftToPay,
      this.lastModified,
      this.creditStatus,
      this.dueAmount,
      this.dueDate,
      this.reference})
      : super._();

  @override
  BookingsRecord rebuild(void Function(BookingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingsRecordBuilder toBuilder() =>
      new BookingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingsRecord &&
        projectRef == other.projectRef &&
        planRef == other.planRef &&
        buyerRef == other.buyerRef &&
        totalAmountToPay == other.totalAmountToPay &&
        areaBookedInSqft == other.areaBookedInSqft &&
        bookingAmount == other.bookingAmount &&
        downPayment == other.downPayment &&
        emiAmount == other.emiAmount &&
        emiTenureInMonths == other.emiTenureInMonths &&
        created == other.created &&
        isApproved == other.isApproved &&
        comments == other.comments &&
        amountLeftToPay == other.amountLeftToPay &&
        lastModified == other.lastModified &&
        creditStatus == other.creditStatus &&
        dueAmount == other.dueAmount &&
        dueDate == other.dueDate &&
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
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            projectRef
                                                                                .hashCode),
                                                                        planRef
                                                                            .hashCode),
                                                                    buyerRef
                                                                        .hashCode),
                                                                totalAmountToPay
                                                                    .hashCode),
                                                            areaBookedInSqft
                                                                .hashCode),
                                                        bookingAmount.hashCode),
                                                    downPayment.hashCode),
                                                emiAmount.hashCode),
                                            emiTenureInMonths.hashCode),
                                        created.hashCode),
                                    isApproved.hashCode),
                                comments.hashCode),
                            amountLeftToPay.hashCode),
                        lastModified.hashCode),
                    creditStatus.hashCode),
                dueAmount.hashCode),
            dueDate.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BookingsRecord')
          ..add('projectRef', projectRef)
          ..add('planRef', planRef)
          ..add('buyerRef', buyerRef)
          ..add('totalAmountToPay', totalAmountToPay)
          ..add('areaBookedInSqft', areaBookedInSqft)
          ..add('bookingAmount', bookingAmount)
          ..add('downPayment', downPayment)
          ..add('emiAmount', emiAmount)
          ..add('emiTenureInMonths', emiTenureInMonths)
          ..add('created', created)
          ..add('isApproved', isApproved)
          ..add('comments', comments)
          ..add('amountLeftToPay', amountLeftToPay)
          ..add('lastModified', lastModified)
          ..add('creditStatus', creditStatus)
          ..add('dueAmount', dueAmount)
          ..add('dueDate', dueDate)
          ..add('reference', reference))
        .toString();
  }
}

class BookingsRecordBuilder
    implements Builder<BookingsRecord, BookingsRecordBuilder> {
  _$BookingsRecord _$v;

  DocumentReference<Object> _projectRef;
  DocumentReference<Object> get projectRef => _$this._projectRef;
  set projectRef(DocumentReference<Object> projectRef) =>
      _$this._projectRef = projectRef;

  DocumentReference<Object> _planRef;
  DocumentReference<Object> get planRef => _$this._planRef;
  set planRef(DocumentReference<Object> planRef) => _$this._planRef = planRef;

  DocumentReference<Object> _buyerRef;
  DocumentReference<Object> get buyerRef => _$this._buyerRef;
  set buyerRef(DocumentReference<Object> buyerRef) =>
      _$this._buyerRef = buyerRef;

  double _totalAmountToPay;
  double get totalAmountToPay => _$this._totalAmountToPay;
  set totalAmountToPay(double totalAmountToPay) =>
      _$this._totalAmountToPay = totalAmountToPay;

  int _areaBookedInSqft;
  int get areaBookedInSqft => _$this._areaBookedInSqft;
  set areaBookedInSqft(int areaBookedInSqft) =>
      _$this._areaBookedInSqft = areaBookedInSqft;

  double _bookingAmount;
  double get bookingAmount => _$this._bookingAmount;
  set bookingAmount(double bookingAmount) =>
      _$this._bookingAmount = bookingAmount;

  double _downPayment;
  double get downPayment => _$this._downPayment;
  set downPayment(double downPayment) => _$this._downPayment = downPayment;

  double _emiAmount;
  double get emiAmount => _$this._emiAmount;
  set emiAmount(double emiAmount) => _$this._emiAmount = emiAmount;

  int _emiTenureInMonths;
  int get emiTenureInMonths => _$this._emiTenureInMonths;
  set emiTenureInMonths(int emiTenureInMonths) =>
      _$this._emiTenureInMonths = emiTenureInMonths;

  DateTime _created;
  DateTime get created => _$this._created;
  set created(DateTime created) => _$this._created = created;

  bool _isApproved;
  bool get isApproved => _$this._isApproved;
  set isApproved(bool isApproved) => _$this._isApproved = isApproved;

  ListBuilder<String> _comments;
  ListBuilder<String> get comments =>
      _$this._comments ??= new ListBuilder<String>();
  set comments(ListBuilder<String> comments) => _$this._comments = comments;

  double _amountLeftToPay;
  double get amountLeftToPay => _$this._amountLeftToPay;
  set amountLeftToPay(double amountLeftToPay) =>
      _$this._amountLeftToPay = amountLeftToPay;

  DateTime _lastModified;
  DateTime get lastModified => _$this._lastModified;
  set lastModified(DateTime lastModified) =>
      _$this._lastModified = lastModified;

  bool _creditStatus;
  bool get creditStatus => _$this._creditStatus;
  set creditStatus(bool creditStatus) => _$this._creditStatus = creditStatus;

  double _dueAmount;
  double get dueAmount => _$this._dueAmount;
  set dueAmount(double dueAmount) => _$this._dueAmount = dueAmount;

  DateTime _dueDate;
  DateTime get dueDate => _$this._dueDate;
  set dueDate(DateTime dueDate) => _$this._dueDate = dueDate;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BookingsRecordBuilder() {
    BookingsRecord._initializeBuilder(this);
  }

  BookingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectRef = $v.projectRef;
      _planRef = $v.planRef;
      _buyerRef = $v.buyerRef;
      _totalAmountToPay = $v.totalAmountToPay;
      _areaBookedInSqft = $v.areaBookedInSqft;
      _bookingAmount = $v.bookingAmount;
      _downPayment = $v.downPayment;
      _emiAmount = $v.emiAmount;
      _emiTenureInMonths = $v.emiTenureInMonths;
      _created = $v.created;
      _isApproved = $v.isApproved;
      _comments = $v.comments?.toBuilder();
      _amountLeftToPay = $v.amountLeftToPay;
      _lastModified = $v.lastModified;
      _creditStatus = $v.creditStatus;
      _dueAmount = $v.dueAmount;
      _dueDate = $v.dueDate;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingsRecord;
  }

  @override
  void update(void Function(BookingsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BookingsRecord build() {
    _$BookingsRecord _$result;
    try {
      _$result = _$v ??
          new _$BookingsRecord._(
              projectRef: projectRef,
              planRef: planRef,
              buyerRef: buyerRef,
              totalAmountToPay: totalAmountToPay,
              areaBookedInSqft: areaBookedInSqft,
              bookingAmount: bookingAmount,
              downPayment: downPayment,
              emiAmount: emiAmount,
              emiTenureInMonths: emiTenureInMonths,
              created: created,
              isApproved: isApproved,
              comments: _comments?.build(),
              amountLeftToPay: amountLeftToPay,
              lastModified: lastModified,
              creditStatus: creditStatus,
              dueAmount: dueAmount,
              dueDate: dueDate,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'comments';
        _comments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BookingsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
