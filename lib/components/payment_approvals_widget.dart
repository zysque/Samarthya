import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/payment_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentApprovalsWidget extends StatefulWidget {
  const PaymentApprovalsWidget({
    Key key,
    this.transRef,
    this.isCommission,
  }) : super(key: key);

  final DocumentReference transRef;
  final bool isCommission;

  @override
  _PaymentApprovalsWidgetState createState() => _PaymentApprovalsWidgetState();
}

class _PaymentApprovalsWidgetState extends State<PaymentApprovalsWidget> {
  String dropDownValue1;
  TextEditingController amountBPController;
  String dropDownValue2;
  TextEditingController amountCPController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TransactionsRecord>(
      stream: TransactionsRecord.getDocument(widget.transRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitPumpingHeart(
                color: FlutterFlowTheme.primaryColor,
                size: 40,
              ),
            ),
          );
        }
        final containerTransactionsRecord = snapshot.data;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.darkBackground,
          ),
          child: StreamBuilder<List<CalculationsRecord>>(
            stream: queryCalculationsRecord(
              queryBuilder: (calculationsRecord) => calculationsRecord
                  .where('userRef', isEqualTo: currentUserReference),
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
                      color: FlutterFlowTheme.primaryColor,
                      size: 40,
                    ),
                  ),
                );
              }
              List<CalculationsRecord> columnCalculationsRecordList =
                  snapshot.data;
              final columnCalculationsRecord =
                  columnCalculationsRecordList.isNotEmpty
                      ? columnCalculationsRecordList.first
                      : null;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: FaIcon(
                                FontAwesomeIcons.solidWindowClose,
                                color: Color(0xFF810933),
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (!(widget.isCommission) ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 175,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.background,
                          ),
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
                                      color: FlutterFlowTheme.primaryColor,
                                      size: 40,
                                    ),
                                  ),
                                );
                              }
                              List<AdminConstsRecord>
                                  bookingPayAdminConstsRecordList =
                                  snapshot.data;
                              final bookingPayAdminConstsRecord =
                                  bookingPayAdminConstsRecordList.isNotEmpty
                                      ? bookingPayAdminConstsRecordList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Payment',
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFFC5E1A5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 20, 40, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        TextFormField(
                                          controller: amountBPController ??=
                                              TextEditingController(
                                            text: formatNumber(
                                              containerTransactionsRecord
                                                  .transactionAmount,
                                              formatType: FormatType.custom,
                                              currency: '',
                                              format: '',
                                              locale: '',
                                            ),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Amount to Pay',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: FlutterFlowTheme.textColor,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.textColor,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: FlutterFlowDropDown(
                                            options: ['Cash'].toList(),
                                            onChanged: (val) => setState(
                                                () => dropDownValue1 = val),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50,
                                            textStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: FlutterFlowTheme.textColor,
                                            ),
                                            hintText: 'Select Mode',
                                            fillColor:
                                                FlutterFlowTheme.background,
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0,
                                            borderRadius: 0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 4, 12, 4),
                                            hidesUnderline: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 25, 0, 0),
                                    child: StreamBuilder<BookingsRecord>(
                                      stream: BookingsRecord.getDocument(
                                          containerTransactionsRecord
                                              .bookingRef),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: SpinKitPumpingHeart(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                                size: 40,
                                              ),
                                            ),
                                          );
                                        }
                                        final actionsBookingsRecord =
                                            snapshot.data;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<
                                                List<CommissionsRecord>>(
                                              stream: queryCommissionsRecord(
                                                queryBuilder: (commissionsRecord) =>
                                                    commissionsRecord
                                                        .where('bookingRef',
                                                            isEqualTo:
                                                                actionsBookingsRecord
                                                                    .reference)
                                                        .where('isDirect',
                                                            isEqualTo: true),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child:
                                                          SpinKitPumpingHeart(
                                                        color: FlutterFlowTheme
                                                            .primaryColor,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CommissionsRecord>
                                                    approveBPCommissionsRecordList =
                                                    snapshot.data;
                                                final approveBPCommissionsRecord =
                                                    approveBPCommissionsRecordList
                                                            .isNotEmpty
                                                        ? approveBPCommissionsRecordList
                                                            .first
                                                        : null;
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    final transactionsUpdateData =
                                                        createTransactionsRecordData(
                                                      transactionAmount:
                                                          double.parse(
                                                              amountBPController
                                                                      ?.text ??
                                                                  ''),
                                                      mode: dropDownValue1,
                                                      status: true,
                                                    );
                                                    await widget.transRef.update(
                                                        transactionsUpdateData);

                                                    final bookingsUpdateData =
                                                        createBookingsRecordData(
                                                      amountLeftToPay: functions.getDiff(
                                                          actionsBookingsRecord
                                                              .amountLeftToPay,
                                                          double.parse(
                                                              amountBPController
                                                                      ?.text ??
                                                                  '')),
                                                      dueAmount: functions.getDiff(
                                                          functions.getSum(
                                                              actionsBookingsRecord
                                                                  .dueAmount,
                                                              actionsBookingsRecord
                                                                  .emiAmount),
                                                          double.parse(
                                                              amountBPController
                                                                      ?.text ??
                                                                  '')),
                                                      dueDate: functions.getNewDate(
                                                          actionsBookingsRecord
                                                              .dueDate,
                                                          0,
                                                          1,
                                                          bookingPayAdminConstsRecord
                                                              .emiPaymentDay),
                                                      creditStatus: (functions.getDiff(
                                                              actionsBookingsRecord
                                                                  .amountLeftToPay,
                                                              double.parse(
                                                                  amountBPController
                                                                          ?.text ??
                                                                      ''))) >
                                                          0.0,
                                                    );
                                                    await actionsBookingsRecord
                                                        .reference
                                                        .update(
                                                            bookingsUpdateData);

                                                    final calculationsUpdateData =
                                                        createCalculationsRecordData(
                                                      emiDueAmount: functions.getSum(
                                                          functions.getDiff(
                                                              columnCalculationsRecord
                                                                  .emiDueAmount,
                                                              double.parse(
                                                                  amountBPController
                                                                          ?.text ??
                                                                      '')),
                                                          actionsBookingsRecord
                                                              .emiAmount),
                                                      unsettledDirect: functions.getSum(
                                                          columnCalculationsRecord
                                                              .unsettledDirect,
                                                          double.parse(
                                                              amountBPController
                                                                      ?.text ??
                                                                  '')),
                                                    );
                                                    await columnCalculationsRecord
                                                        .reference
                                                        .update(
                                                            calculationsUpdateData);

                                                    final commissionsUpdateData =
                                                        createCommissionsRecordData(
                                                      commissionAmount: functions
                                                          .getCommission(
                                                              bookingPayAdminConstsRecord
                                                                  .directPer,
                                                              double.parse(
                                                                  amountBPController
                                                                          ?.text ??
                                                                      '')),
                                                      unsettledAmount: functions.getSum(
                                                          approveBPCommissionsRecord
                                                              .unsettledAmount,
                                                          double.parse(
                                                              amountBPController
                                                                      ?.text ??
                                                                  '')),
                                                      settled: false,
                                                    );
                                                    await approveBPCommissionsRecord
                                                        .reference
                                                        .update(
                                                            commissionsUpdateData);
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child: PaymentWidget(
                                                            bookingDetails:
                                                                actionsBookingsRecord
                                                                    .reference,
                                                            isCommission: false,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  text: 'Approve',
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Colors.white,
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
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
                      ),
                    if (widget.isCommission ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 175,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.background,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'Commission',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFFC5E1A5),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 20, 40, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      controller: amountCPController ??=
                                          TextEditingController(
                                        text: formatNumber(
                                          containerTransactionsRecord
                                              .transactionAmount,
                                          formatType: FormatType.custom,
                                          currency: '',
                                          format: '',
                                          locale: '',
                                        ),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Amount to Pay',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.textColor,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.textColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FlutterFlowDropDown(
                                        options: ['Cash'].toList(),
                                        onChanged: (val) => setState(
                                            () => dropDownValue2 = val),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        textStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.textColor,
                                        ),
                                        hintText: 'Select Mode',
                                        fillColor: FlutterFlowTheme.background,
                                        elevation: 2,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        borderRadius: 0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<CommissionsRecord>>(
                                      stream: queryCommissionsRecord(
                                        queryBuilder: (commissionsRecord) =>
                                            commissionsRecord
                                                .where('bookingRef',
                                                    isEqualTo:
                                                        containerTransactionsRecord
                                                            .bookingRef)
                                                .where('isDirect',
                                                    isEqualTo: true),
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
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                                size: 40,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CommissionsRecord>
                                            approveCPCommissionsRecordList =
                                            snapshot.data;
                                        final approveCPCommissionsRecord =
                                            approveCPCommissionsRecordList
                                                    .isNotEmpty
                                                ? approveCPCommissionsRecordList
                                                    .first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            final transactionsUpdateData =
                                                createTransactionsRecordData(
                                              transactionAmount: double.parse(
                                                  amountCPController?.text ??
                                                      ''),
                                              mode: dropDownValue2,
                                              status: true,
                                            );
                                            await widget.transRef
                                                .update(transactionsUpdateData);

                                            final calculationsUpdateData =
                                                createCalculationsRecordData(
                                              directCommission:
                                                  functions.getSum(
                                                      columnCalculationsRecord
                                                          .directCommission,
                                                      double.parse(
                                                          amountCPController
                                                                  ?.text ??
                                                              '')),
                                              unsettledDirect:
                                                  functions.getDiff(
                                                      columnCalculationsRecord
                                                          .unsettledDirect,
                                                      double.parse(
                                                          amountCPController
                                                                  ?.text ??
                                                              '')),
                                              comissionProcessed:
                                                  getCurrentTimestamp,
                                            );
                                            await columnCalculationsRecord
                                                .reference
                                                .update(calculationsUpdateData);

                                            final commissionsUpdateData = {
                                              ...createCommissionsRecordData(
                                                commissionAmount: functions.getSum(
                                                    functions.getDiff(
                                                        approveCPCommissionsRecord
                                                            .commissionAmount,
                                                        containerTransactionsRecord
                                                            .transactionAmount),
                                                    double.parse(
                                                        amountCPController
                                                                ?.text ??
                                                            '')),
                                                lastModified:
                                                    getCurrentTimestamp,
                                              ),
                                              'commTransRef':
                                                  FieldValue.arrayUnion(
                                                      [widget.transRef]),
                                            };
                                            await approveCPCommissionsRecord
                                                .reference
                                                .update(commissionsUpdateData);
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: PaymentWidget(
                                                    bookingDetails:
                                                        containerTransactionsRecord
                                                            .bookingRef,
                                                    commissionDetails:
                                                        approveCPCommissionsRecord
                                                            .reference,
                                                    isCommission: true,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          text: 'Approve',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            textStyle: FlutterFlowTheme
                                                .subtitle2
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 12,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
