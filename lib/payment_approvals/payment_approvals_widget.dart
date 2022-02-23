import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentApprovalsWidget extends StatefulWidget {
  const PaymentApprovalsWidget({
    Key key,
    this.transactionDetails,
  }) : super(key: key);

  final DocumentReference transactionDetails;

  @override
  _PaymentApprovalsWidgetState createState() => _PaymentApprovalsWidgetState();
}

class _PaymentApprovalsWidgetState extends State<PaymentApprovalsWidget> {
  String dropDownValue;
  TextEditingController amountBPController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'HomePage'),
              ),
              (r) => false,
            );
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Payment Approval',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).textColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).background,
      body: SafeArea(
        child: StreamBuilder<TransactionsRecord>(
          stream: TransactionsRecord.getDocument(widget.transactionDetails),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: SpinKitPumpingHeart(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 40,
                  ),
                ),
              );
            }
            final columnTransactionsRecord = snapshot.data;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).background,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Payment Approval',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFFC5E1A5),
                                ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                columnTransactionsRecord.transactionID,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: amountBPController ??=
                                      TextEditingController(
                                    text: columnTransactionsRecord
                                        .transactionAmount
                                        .toString(),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Amount to Pay',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .grayDark,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .grayDark,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 4, 20, 4),
                                    prefixIcon: FaIcon(
                                      FontAwesomeIcons.rupeeSign,
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: FlutterFlowDropDown(
                                  initialOption: dropDownValue ??=
                                      columnTransactionsRecord.mode,
                                  options: ['Cash'].toList(),
                                  onChanged: (val) =>
                                      setState(() => dropDownValue = val),
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                      ),
                                  hintText: 'Select Mode',
                                  fillColor:
                                      FlutterFlowTheme.of(context).background,
                                  elevation: 2,
                                  borderColor:
                                      FlutterFlowTheme.of(context).grayDark,
                                  borderWidth: 0,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: StreamBuilder<List<AdminConstsRecord>>(
                    stream: queryAdminConstsRecord(
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: SpinKitPumpingHeart(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 40,
                            ),
                          ),
                        );
                      }
                      List<AdminConstsRecord> actionsAdminConstsRecordList =
                          snapshot.data;
                      final actionsAdminConstsRecord =
                          actionsAdminConstsRecordList.isNotEmpty
                              ? actionsAdminConstsRecordList.first
                              : null;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<BookingsRecord>(
                            stream: BookingsRecord.getDocument(
                                columnTransactionsRecord.bookingRef),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: SpinKitPumpingHeart(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 40,
                                    ),
                                  ),
                                );
                              }
                              final columnBookingsRecord = snapshot.data;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<CalculationsRecord>>(
                                    stream: queryCalculationsRecord(
                                      queryBuilder: (calculationsRecord) =>
                                          calculationsRecord.where('userRef',
                                              isEqualTo:
                                                  columnTransactionsRecord
                                                      .transactionUser),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: SpinKitPumpingHeart(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<CalculationsRecord>
                                          columnCalculationsRecordList =
                                          snapshot.data;
                                      final columnCalculationsRecord =
                                          columnCalculationsRecordList
                                                  .isNotEmpty
                                              ? columnCalculationsRecordList
                                                  .first
                                              : null;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          StreamBuilder<
                                              List<UserHierarchiesRecord>>(
                                            stream: queryUserHierarchiesRecord(
                                              queryBuilder: (userHierarchiesRecord) =>
                                                  userHierarchiesRecord.where(
                                                      'hierarchyUser',
                                                      isEqualTo:
                                                          columnTransactionsRecord
                                                              .transactionUser),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: SpinKitPumpingHeart(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 40,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UserHierarchiesRecord>
                                                  columnUserHierarchiesRecordList =
                                                  snapshot.data;
                                              final columnUserHierarchiesRecord =
                                                  columnUserHierarchiesRecordList
                                                          .isNotEmpty
                                                      ? columnUserHierarchiesRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (columnUserHierarchiesRecord
                                                          .hasReferral ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: StreamBuilder<
                                                          CommissionsRecord>(
                                                        stream: CommissionsRecord
                                                            .getDocument(
                                                                columnTransactionsRecord
                                                                    .commissionRef),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 40,
                                                                height: 40,
                                                                child:
                                                                    SpinKitPumpingHeart(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 40,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final approveBPCommissionsRecord =
                                                              snapshot.data;
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              final transactionsUpdateData =
                                                                  createTransactionsRecordData(
                                                                transactionAmount:
                                                                    double.parse(
                                                                        amountBPController?.text ??
                                                                            ''),
                                                                mode:
                                                                    dropDownValue,
                                                                status: true,
                                                                transactionID:
                                                                    '${columnCalculationsRecord.userCode}_T${columnCalculationsRecord.transCount.toString()}',
                                                              );
                                                              await widget
                                                                  .transactionDetails
                                                                  .update(
                                                                      transactionsUpdateData);

                                                              final bookingsUpdateData =
                                                                  createBookingsRecordData(
                                                                amountLeftToPay: functions.getDiff(
                                                                    columnBookingsRecord
                                                                        .amountLeftToPay,
                                                                    double.parse(
                                                                        amountBPController?.text ??
                                                                            '')),
                                                                dueAmount: functions.getDiff(
                                                                    functions.getSum(
                                                                        columnBookingsRecord
                                                                            .dueAmount,
                                                                        columnBookingsRecord
                                                                            .emiAmount),
                                                                    double.parse(
                                                                        amountBPController?.text ??
                                                                            '')),
                                                                dueDate: functions.getNewDate(
                                                                    columnBookingsRecord
                                                                        .dueDate,
                                                                    0,
                                                                    1,
                                                                    actionsAdminConstsRecord
                                                                        .emiPaymentDay,
                                                                    (functions.getDiff(
                                                                            columnBookingsRecord
                                                                                .dueAmount,
                                                                            double.parse(amountBPController?.text ??
                                                                                ''))) <=
                                                                        0.0,
                                                                    columnBookingsRecord
                                                                        .dueDate),
                                                                creditStatus: (functions.getDiff(
                                                                        columnBookingsRecord
                                                                            .amountLeftToPay,
                                                                        double.parse(amountBPController?.text ??
                                                                            ''))) >
                                                                    0.0,
                                                              );
                                                              await columnTransactionsRecord
                                                                  .bookingRef
                                                                  .update(
                                                                      bookingsUpdateData);

                                                              final calculationsUpdateData =
                                                                  {
                                                                ...createCalculationsRecordData(
                                                                  emiDueAmount: functions.getDiff(
                                                                      functions.getSum(
                                                                          columnCalculationsRecord
                                                                              .emiDueAmount,
                                                                          columnBookingsRecord
                                                                              .emiAmount),
                                                                      double.parse(
                                                                          amountBPController?.text ??
                                                                              '')),
                                                                  emiDueDate: functions.getNewDate(
                                                                      columnBookingsRecord
                                                                          .dueDate,
                                                                      0,
                                                                      1,
                                                                      actionsAdminConstsRecord
                                                                          .emiPaymentDay,
                                                                      (functions.getDiff(
                                                                              columnCalculationsRecord
                                                                                  .emiDueAmount,
                                                                              double.parse(amountBPController?.text ??
                                                                                  ''))) <=
                                                                          0.0,
                                                                      columnCalculationsRecord
                                                                          .emiDueDate),
                                                                  unPBusinessAmt: functions.getSum(
                                                                      columnCalculationsRecord
                                                                          .unPBusinessAmt,
                                                                      double.parse(
                                                                          amountBPController?.text ??
                                                                              '')),
                                                                ),
                                                                'transCount':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await columnCalculationsRecord
                                                                  .reference
                                                                  .update(
                                                                      calculationsUpdateData);

                                                              final commissionsUpdateData =
                                                                  {
                                                                ...createCommissionsRecordData(
                                                                  unsettledAmount: functions.getSum(
                                                                      approveBPCommissionsRecord
                                                                          .unsettledAmount,
                                                                      functions.getCommission(
                                                                          actionsAdminConstsRecord
                                                                              .directPer,
                                                                          double.parse(amountBPController?.text ??
                                                                              ''))),
                                                                  settled:
                                                                      false,
                                                                  lastModified:
                                                                      getCurrentTimestamp,
                                                                ),
                                                                'comments':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  'Commission for business of amount ${amountBPController?.text ?? ''} is processed at ${dateTimeFormat('d/M H:mm', getCurrentTimestamp)}'
                                                                ]),
                                                              };
                                                              await columnTransactionsRecord
                                                                  .commissionRef
                                                                  .update(
                                                                      commissionsUpdateData);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            text: 'Approve',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 130,
                                                              height: 40,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: 12,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  if (!(columnUserHierarchiesRecord
                                                          .hasReferral) ??
                                                      true)
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        final transactionsUpdateData =
                                                            createTransactionsRecordData(
                                                          transactionAmount:
                                                              double.parse(
                                                                  amountBPController
                                                                          ?.text ??
                                                                      ''),
                                                          mode: dropDownValue,
                                                          status: true,
                                                          transactionID:
                                                              '${columnCalculationsRecord.userCode}_T${columnCalculationsRecord.transCount.toString()}',
                                                        );
                                                        await widget
                                                            .transactionDetails
                                                            .update(
                                                                transactionsUpdateData);

                                                        final bookingsUpdateData =
                                                            createBookingsRecordData(
                                                          amountLeftToPay: functions.getDiff(
                                                              columnBookingsRecord
                                                                  .amountLeftToPay,
                                                              double.parse(
                                                                  amountBPController
                                                                          ?.text ??
                                                                      '')),
                                                          dueAmount: functions.getDiff(
                                                              functions.getSum(
                                                                  columnBookingsRecord
                                                                      .dueAmount,
                                                                  columnBookingsRecord
                                                                      .emiAmount),
                                                              double.parse(
                                                                  amountBPController
                                                                          ?.text ??
                                                                      '')),
                                                          dueDate: functions.getNewDate(
                                                              columnBookingsRecord
                                                                  .dueDate,
                                                              0,
                                                              1,
                                                              actionsAdminConstsRecord
                                                                  .emiPaymentDay,
                                                              (functions.getDiff(
                                                                      columnBookingsRecord
                                                                          .dueAmount,
                                                                      double.parse(
                                                                          amountBPController?.text ??
                                                                              ''))) <=
                                                                  0.0,
                                                              columnBookingsRecord
                                                                  .dueDate),
                                                          creditStatus: (functions.getDiff(
                                                                  columnBookingsRecord
                                                                      .amountLeftToPay,
                                                                  double.parse(
                                                                      amountBPController
                                                                              ?.text ??
                                                                          ''))) >
                                                              0.0,
                                                        );
                                                        await columnTransactionsRecord
                                                            .bookingRef
                                                            .update(
                                                                bookingsUpdateData);

                                                        final calculationsUpdateData =
                                                            {
                                                          ...createCalculationsRecordData(
                                                            emiDueAmount: functions.getDiff(
                                                                functions.getSum(
                                                                    columnCalculationsRecord
                                                                        .emiDueAmount,
                                                                    columnBookingsRecord
                                                                        .emiAmount),
                                                                double.parse(
                                                                    amountBPController
                                                                            ?.text ??
                                                                        '')),
                                                            emiDueDate: functions.getNewDate(
                                                                columnBookingsRecord
                                                                    .dueDate,
                                                                0,
                                                                1,
                                                                actionsAdminConstsRecord
                                                                    .emiPaymentDay,
                                                                (functions.getDiff(
                                                                        columnCalculationsRecord
                                                                            .emiDueAmount,
                                                                        double.parse(amountBPController?.text ??
                                                                            ''))) <=
                                                                    0.0,
                                                                columnCalculationsRecord
                                                                    .emiDueDate),
                                                          ),
                                                          'transCount':
                                                              FieldValue
                                                                  .increment(1),
                                                        };
                                                        await columnCalculationsRecord
                                                            .reference
                                                            .update(
                                                                calculationsUpdateData);
                                                        Navigator.pop(context);
                                                      },
                                                      text: 'Approve',
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 40,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 12,
                                                      ),
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
