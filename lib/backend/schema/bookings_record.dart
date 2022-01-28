import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bookings_record.g.dart';

abstract class BookingsRecord
    implements Built<BookingsRecord, BookingsRecordBuilder> {
  static Serializer<BookingsRecord> get serializer =>
      _$bookingsRecordSerializer;

  @nullable
  DocumentReference get projectRef;

  @nullable
  DocumentReference get planRef;

  @nullable
  DocumentReference get buyerRef;

  @nullable
  double get totalAmountToPay;

  @nullable
  int get areaBookedInSqft;

  @nullable
  double get bookingAmount;

  @nullable
  double get downPayment;

  @nullable
  double get emiAmount;

  @nullable
  int get emiTenureInMonths;

  @nullable
  DateTime get created;

  @nullable
  bool get isApproved;

  @nullable
  BuiltList<String> get comments;

  @nullable
  double get amountLeftToPay;

  @nullable
  DateTime get lastModified;

  @nullable
  bool get creditStatus;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BookingsRecordBuilder builder) => builder
    ..totalAmountToPay = 0.0
    ..areaBookedInSqft = 0
    ..bookingAmount = 0.0
    ..downPayment = 0.0
    ..emiAmount = 0.0
    ..emiTenureInMonths = 0
    ..isApproved = false
    ..comments = ListBuilder()
    ..amountLeftToPay = 0.0
    ..creditStatus = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BookingsRecord._();
  factory BookingsRecord([void Function(BookingsRecordBuilder) updates]) =
      _$BookingsRecord;

  static BookingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference projectRef,
  DocumentReference planRef,
  DocumentReference buyerRef,
  double totalAmountToPay,
  int areaBookedInSqft,
  double bookingAmount,
  double downPayment,
  double emiAmount,
  int emiTenureInMonths,
  DateTime created,
  bool isApproved,
  double amountLeftToPay,
  DateTime lastModified,
  bool creditStatus,
}) =>
    serializers.toFirestore(
        BookingsRecord.serializer,
        BookingsRecord((b) => b
          ..projectRef = projectRef
          ..planRef = planRef
          ..buyerRef = buyerRef
          ..totalAmountToPay = totalAmountToPay
          ..areaBookedInSqft = areaBookedInSqft
          ..bookingAmount = bookingAmount
          ..downPayment = downPayment
          ..emiAmount = emiAmount
          ..emiTenureInMonths = emiTenureInMonths
          ..created = created
          ..isApproved = isApproved
          ..comments = null
          ..amountLeftToPay = amountLeftToPay
          ..lastModified = lastModified
          ..creditStatus = creditStatus));
