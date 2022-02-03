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

class PayCommissionDuesWidget extends StatefulWidget {
  const PayCommissionDuesWidget({
    Key key,
    this.commissionDetails,
  }) : super(key: key);

  final DocumentReference commissionDetails;

  @override
  _PayCommissionDuesWidgetState createState() =>
      _PayCommissionDuesWidgetState();
}

class _PayCommissionDuesWidgetState extends State<PayCommissionDuesWidget> {
  String dropDownValue;
  TextEditingController amountCPController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
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
            color: FlutterFlowTheme.grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Pay Commission',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.textColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.background,
                ),
                child: StreamBuilder<CommissionsRecord>(
                  stream:
                      CommissionsRecord.getDocument(widget.commissionDetails),
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
                    final commissionPayCommissionsRecord = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Commission',
                            style: FlutterFlowTheme.title3.override(
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
                              TextFormField(
                                controller: amountCPController ??=
                                    TextEditingController(
                                  text: commissionPayCommissionsRecord
                                      .unsettledAmount
                                      .toString(),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Amount to Pay',
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
                                  prefixIcon: FaIcon(
                                    FontAwesomeIcons.rupeeSign,
                                    color: FlutterFlowTheme.textColor,
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.textColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: FlutterFlowDropDown(
                                  options: ['Cash'].toList(),
                                  onChanged: (val) =>
                                      setState(() => dropDownValue = val),
                                  width: MediaQuery.of(context).size.width,
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
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: StreamBuilder<CommissionsRecord>(
                stream: CommissionsRecord.getDocument(widget.commissionDetails),
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
                  final actionsCommissionsRecord = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<CalculationsRecord>>(
                        stream: queryCalculationsRecord(
                          queryBuilder: (calculationsRecord) =>
                              calculationsRecord.where('userRef',
                                  isEqualTo:
                                      actionsCommissionsRecord.commissionUser),
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
                          List<CalculationsRecord> logCPCalculationsRecordList =
                              snapshot.data;
                          final logCPCalculationsRecord =
                              logCPCalculationsRecordList.isNotEmpty
                                  ? logCPCalculationsRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              final transactionsCreateData =
                                  createTransactionsRecordData(
                                transactionUser:
                                    actionsCommissionsRecord.commissionUser,
                                transactionAmount: double.parse(
                                    amountCPController?.text ?? ''),
                                transactionType: 'Commission',
                                mode: dropDownValue,
                                bookingRef: actionsCommissionsRecord.bookingRef,
                                transactionTime: getCurrentTimestamp,
                                commissionRef: widget.commissionDetails,
                                status: true,
                              );
                              await TransactionsRecord.collection
                                  .doc()
                                  .set(transactionsCreateData);

                              final commissionsUpdateData = {
                                ...createCommissionsRecordData(
                                  commissionAmount: functions.getSum(
                                      actionsCommissionsRecord.commissionAmount,
                                      double.parse(
                                          amountCPController?.text ?? '')),
                                  unsettledAmount: functions.getDiff(
                                      actionsCommissionsRecord.unsettledAmount,
                                      double.parse(
                                          amountCPController?.text ?? '')),
                                  settled: (functions.getDiff(
                                          actionsCommissionsRecord
                                              .unsettledAmount,
                                          double.parse(
                                              amountCPController?.text ??
                                                  ''))) <=
                                      0.0,
                                  lastModified: getCurrentTimestamp,
                                ),
                                'comments': FieldValue.arrayUnion([
                                  'Commission of amount ${amountCPController?.text ?? ''} is settled at ${dateTimeFormat('d/M h:mm a', getCurrentTimestamp)}'
                                ]),
                              };
                              await widget.commissionDetails
                                  .update(commissionsUpdateData);

                              final calculationsUpdateData =
                                  createCalculationsRecordData(
                                directCommission: functions.getSum(
                                    logCPCalculationsRecord.directCommission,
                                    double.parse(
                                        amountCPController?.text ?? '')),
                                comissionProcessed: getCurrentTimestamp,
                              );
                              await logCPCalculationsRecord.reference
                                  .update(calculationsUpdateData);
                              Navigator.pop(context);
                            },
                            text: 'Log Pay',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
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
        ),
      ),
    );
  }
}
