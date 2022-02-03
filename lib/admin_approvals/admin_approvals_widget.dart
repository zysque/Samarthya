import '../admin_booking_approval/admin_booking_approval_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../payment_approvals/payment_approvals_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminApprovalsWidget extends StatefulWidget {
  const AdminApprovalsWidget({Key key}) : super(key: key);

  @override
  _AdminApprovalsWidgetState createState() => _AdminApprovalsWidgetState();
}

class _AdminApprovalsWidgetState extends State<AdminApprovalsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 150,
      delay: 90,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 26),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'listViewOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 150,
      delay: 90,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 26),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

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
          'Approvals',
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<BookingsRecord>>(
                    stream: queryBookingsRecord(
                      queryBuilder: (bookingsRecord) => bookingsRecord
                          .where('isApproved', isEqualTo: false)
                          .orderBy('lastModified', descending: true),
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
                      List<BookingsRecord> listViewBookingsRecordList =
                          snapshot.data;
                      if (listViewBookingsRecordList.isEmpty) {
                        return Image.asset(
                          'assets/images/df3hg_',
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewBookingsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewBookingsRecord =
                              listViewBookingsRecordList[listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                            child: StreamBuilder<ProjectsRecord>(
                              stream: ProjectsRecord.getDocument(
                                  listViewBookingsRecord.projectRef),
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
                                final containerProjectsRecord = snapshot.data;
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdminBookingApprovalWidget(
                                          bookingRef:
                                              listViewBookingsRecord.reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  containerProjectsRecord
                                                      .projectName,
                                                  style: FlutterFlowTheme
                                                      .subtitle1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .textColor,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: FlutterFlowTheme
                                                      .textColor,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  containerProjectsRecord
                                                      .projectCity,
                                                  style: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewBookingsRecord
                                                      .areaBookedInSqft
                                                      .toString(),
                                                  style: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .textColor,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 0, 0, 0),
                                                  child: Text(
                                                    'SQFT',
                                                    style: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: FlutterFlowTheme
                                                          .textColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                formatNumber(
                                                  listViewBookingsRecord
                                                      .totalAmountToPay,
                                                  formatType:
                                                      FormatType.compact,
                                                  currency: 'Rs',
                                                ),
                                                style: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme
                                                      .textColor,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(2, 0, 0, 0),
                                                child: Text(
                                                  formatNumber(
                                                    listViewBookingsRecord
                                                        .amountLeftToPay,
                                                    formatType:
                                                        FormatType.compact,
                                                    currency: 'Rs',
                                                  ),
                                                  style: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .textColor,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  listViewBookingsRecord
                                                      .emiAmount,
                                                  formatType:
                                                      FormatType.compact,
                                                  currency: 'Rs',
                                                ),
                                                style: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme
                                                      .textColor,
                                                ),
                                              ),
                                              Text(
                                                listViewBookingsRecord
                                                    .emiTenureInMonths
                                                    .toString(),
                                                style: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme
                                                      .textColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  dateTimeFormat(
                                                      'relative',
                                                      listViewBookingsRecord
                                                          .created),
                                                  style: FlutterFlowTheme
                                                      .bodyText2
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                if (listViewBookingsRecord
                                                        .creditStatus ??
                                                    true)
                                                  Text(
                                                    'Running EMIs',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFFE91E63),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ).animated(
                          [animationsMap['listViewOnPageLoadAnimation1']]);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<TransactionsRecord>>(
                    stream: queryTransactionsRecord(
                      queryBuilder: (transactionsRecord) => transactionsRecord
                          .where('status', isEqualTo: false)
                          .orderBy('transactionTime', descending: true),
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
                      List<TransactionsRecord> listViewTransactionsRecordList =
                          snapshot.data;
                      if (listViewTransactionsRecordList.isEmpty) {
                        return Center(
                          child: Image.network(
                            '',
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTransactionsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTransactionsRecord =
                              listViewTransactionsRecordList[listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                            child: StreamBuilder<BookingsRecord>(
                              stream: BookingsRecord.getDocument(
                                  listViewTransactionsRecord.bookingRef),
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
                                final containerBookingsRecord = snapshot.data;
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PaymentApprovalsWidget(
                                          transactionDetails:
                                              listViewTransactionsRecord
                                                  .reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  formatNumber(
                                                    listViewTransactionsRecord
                                                        .transactionAmount,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '',
                                                    format: '',
                                                    locale: '',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.title3,
                                                ),
                                                Text(
                                                  listViewTransactionsRecord
                                                      .mode,
                                                  style:
                                                      FlutterFlowTheme.title3,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewTransactionsRecord
                                                      .transactionType,
                                                  style: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child:
                                                StreamBuilder<ProjectsRecord>(
                                              stream:
                                                  ProjectsRecord.getDocument(
                                                      containerBookingsRecord
                                                          .projectRef),
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
                                                final rowProjectsRecord =
                                                    snapshot.data;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      rowProjectsRecord
                                                          .projectName,
                                                      style: FlutterFlowTheme
                                                          .subtitle2
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: FlutterFlowTheme
                                                            .textColor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2, 0, 0, 0),
                                                      child: Text(
                                                        rowProjectsRecord
                                                            .projectCity,
                                                        style: FlutterFlowTheme
                                                            .subtitle2
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              FlutterFlowTheme
                                                                  .textColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    containerBookingsRecord
                                                        .areaBookedInSqft
                                                        .toString(),
                                                    style: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: FlutterFlowTheme
                                                          .textColor,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                2, 0, 0, 0),
                                                    child: Text(
                                                      'SQFT',
                                                      style: FlutterFlowTheme
                                                          .subtitle2
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: FlutterFlowTheme
                                                            .textColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    formatNumber(
                                                      containerBookingsRecord
                                                          .amountLeftToPay,
                                                      formatType:
                                                          FormatType.compact,
                                                      currency: '',
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: FlutterFlowTheme
                                                          .textColor,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                2, 0, 0, 0),
                                                    child: Text(
                                                      'Left',
                                                      style: FlutterFlowTheme
                                                          .subtitle2
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: FlutterFlowTheme
                                                            .textColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                          'EEEE',
                                                          listViewTransactionsRecord
                                                              .transactionTime),
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                          'yMMMd',
                                                          listViewTransactionsRecord
                                                              .transactionTime),
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                          'jms',
                                                          listViewTransactionsRecord
                                                              .transactionTime),
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (listViewTransactionsRecord
                                                        .status ??
                                                    true)
                                                  Text(
                                                    'Successful',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF7CD514),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ).animated(
                          [animationsMap['listViewOnPageLoadAnimation2']]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
