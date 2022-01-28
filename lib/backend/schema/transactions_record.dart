import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transactions_record.g.dart';

abstract class TransactionsRecord
    implements Built<TransactionsRecord, TransactionsRecordBuilder> {
  static Serializer<TransactionsRecord> get serializer =>
      _$transactionsRecordSerializer;

  @nullable
  DocumentReference get transactionUser;

  @nullable
  double get transactionAmount;

  @nullable
  String get transactionType;

  @nullable
  DocumentReference get bookingRef;

  @nullable
  DocumentReference get commissionRef;

  @nullable
  String get mode;

  @nullable
  DateTime get transactionTime;

  @nullable
  bool get status;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionsRecordBuilder builder) => builder
    ..transactionAmount = 0.0
    ..transactionType = ''
    ..mode = ''
    ..status = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionsRecord._();
  factory TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =
      _$TransactionsRecord;

  static TransactionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference transactionUser,
  double transactionAmount,
  String transactionType,
  DocumentReference bookingRef,
  DocumentReference commissionRef,
  String mode,
  DateTime transactionTime,
  bool status,
}) =>
    serializers.toFirestore(
        TransactionsRecord.serializer,
        TransactionsRecord((t) => t
          ..transactionUser = transactionUser
          ..transactionAmount = transactionAmount
          ..transactionType = transactionType
          ..bookingRef = bookingRef
          ..commissionRef = commissionRef
          ..mode = mode
          ..transactionTime = transactionTime
          ..status = status));
