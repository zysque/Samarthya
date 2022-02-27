import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PayDuesWidget extends StatefulWidget {
  const PayDuesWidget({
    Key key,
    this.bookingDetails,
  }) : super(key: key);

  final DocumentReference bookingDetails;

  @override
  _PayDuesWidgetState createState() => _PayDuesWidgetState();
}

class _PayDuesWidgetState extends State<PayDuesWidget> {
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
          'Pay Dues',
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
        child: StreamBuilder<BookingsRecord>(
          stream: BookingsRecord.getDocument(widget.bookingDetails),
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
            final columnBookingsRecord = snapshot.data;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 175,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).background,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Payment',
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
                              TextFormField(
                                controller: amountBPController ??=
                                    TextEditingController(
                                  text:
                                      columnBookingsRecord.dueAmount.toString(),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Amount to Pay',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  prefixIcon: FaIcon(
                                    FontAwesomeIcons.rupeeSign,
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: FlutterFlowDropDown(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: StreamBuilder<List<UserHierarchiesRecord>>(
                    stream: queryUserHierarchiesRecord(
                      queryBuilder: (userHierarchiesRecord) =>
                          userHierarchiesRecord.where('hierarchyUser',
                              isEqualTo: currentUserReference),
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
                      List<UserHierarchiesRecord>
                          actionsUserHierarchiesRecordList = snapshot.data;
                      final actionsUserHierarchiesRecord =
                          actionsUserHierarchiesRecordList.isNotEmpty
                              ? actionsUserHierarchiesRecordList.first
                              : null;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (actionsUserHierarchiesRecord.hasReferral ?? true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: StreamBuilder<List<CommissionsRecord>>(
                                stream: queryCommissionsRecord(
                                  queryBuilder: (commissionsRecord) =>
                                      commissionsRecord
                                          .where(
                                              'commissionUser',
                                              isEqualTo:
                                                  actionsUserHierarchiesRecord
                                                      .referralParent)
                                          .where('isDirect', isEqualTo: true)
                                          .where('bookingRef',
                                              isEqualTo: widget.bookingDetails),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 40,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CommissionsRecord>
                                      logBPCommissionsRecordList =
                                      snapshot.data;
                                  final logBPCommissionsRecord =
                                      logBPCommissionsRecordList.isNotEmpty
                                          ? logBPCommissionsRecordList.first
                                          : null;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      final transactionsCreateData =
                                          createTransactionsRecordData(
                                        transactionUser: currentUserReference,
                                        transactionType: 'Booking',
                                        mode: dropDownValue,
                                        bookingRef: widget.bookingDetails,
                                        transactionTime: getCurrentTimestamp,
                                        transactionAmount: double.parse(
                                            amountBPController?.text ?? ''),
                                        status: false,
                                        commissionRef:
                                            logBPCommissionsRecord.reference,
                                      );
                                      await TransactionsRecord.collection
                                          .doc()
                                          .set(transactionsCreateData);

                                      final bookingsUpdateData =
                                          createBookingsRecordData(
                                        creditStatus: false,
                                      );
                                      await columnBookingsRecord.reference
                                          .update(bookingsUpdateData);
                                      Navigator.pop(context);
                                    },
                                    text: 'Log Pay',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
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
                            ),
                          if (!(actionsUserHierarchiesRecord.hasReferral) ??
                              true)
                            FFButtonWidget(
                              onPressed: () async {
                                final transactionsCreateData =
                                    createTransactionsRecordData(
                                  transactionUser: currentUserReference,
                                  transactionType: 'Booking',
                                  mode: dropDownValue,
                                  bookingRef: widget.bookingDetails,
                                  transactionTime: getCurrentTimestamp,
                                  transactionAmount: double.parse(
                                      amountBPController?.text ?? ''),
                                  status: false,
                                );
                                await TransactionsRecord.collection
                                    .doc()
                                    .set(transactionsCreateData);

                                final bookingsUpdateData =
                                    createBookingsRecordData(
                                  creditStatus: false,
                                );
                                await columnBookingsRecord.reference
                                    .update(bookingsUpdateData);
                                Navigator.pop(context);
                              },
                              text: 'Log Pay',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
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
