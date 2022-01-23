import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../commission_details/commission_details_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCommissionsWidget extends StatefulWidget {
  const MyCommissionsWidget({Key key}) : super(key: key);

  @override
  _MyCommissionsWidgetState createState() => _MyCommissionsWidgetState();
}

class _MyCommissionsWidgetState extends State<MyCommissionsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 200,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 49),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 200,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 49),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
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
        backgroundColor: FlutterFlowTheme.background,
        automaticallyImplyLeading: false,
        title: Text(
          'My Commisions',
          style: FlutterFlowTheme.title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.background,
      body: SafeArea(
        child: StreamBuilder<List<CalculationListRecord>>(
          stream: queryCalculationListRecord(
            queryBuilder: (calculationListRecord) => calculationListRecord
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
            List<CalculationListRecord> columnCalculationListRecordList =
                snapshot.data;
            // Return an empty Container when the document does not exist.
            if (snapshot.data.isEmpty) {
              return Container();
            }
            final columnCalculationListRecord =
                columnCalculationListRecordList.isNotEmpty
                    ? columnCalculationListRecordList.first
                    : null;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.44,
                              height: 120,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.darkBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Direct',
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: FaIcon(
                                              FontAwesomeIcons.rupeeSign,
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              size: 24,
                                            ),
                                          ),
                                          Text(
                                            functions
                                                .getTotalAmount(
                                                    columnCalculationListRecord
                                                        .directCommission
                                                        .toList())
                                                .toString(),
                                            style: FlutterFlowTheme.title3
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animated([
                              animationsMap['containerOnPageLoadAnimation1']
                            ]),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.44,
                              height: 120,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.darkBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Indirect',
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: FaIcon(
                                              FontAwesomeIcons.rupeeSign,
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              size: 24,
                                            ),
                                          ),
                                          Text(
                                            functions
                                                .getTotalAmount(
                                                    columnCalculationListRecord
                                                        .indirectCommission
                                                        .toList())
                                                .toString(),
                                            style: FlutterFlowTheme.title3
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animated([
                              animationsMap['containerOnPageLoadAnimation2']
                            ]),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                child: Text(
                                  'Direct Commissions',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          StreamBuilder<List<CommissionsRecord>>(
                            stream: queryCommissionsRecord(
                              queryBuilder: (commissionsRecord) =>
                                  commissionsRecord
                                      .where('commissionUser',
                                          isEqualTo: currentUserReference)
                                      .where('commissionType',
                                          isEqualTo: 'Direct'),
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
                              List<CommissionsRecord>
                                  listViewCommissionsRecordList = snapshot.data;
                              if (listViewCommissionsRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/NoSale.JPG',
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewCommissionsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCommissionsRecord =
                                      listViewCommissionsRecordList[
                                          listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 12),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CommissionDetailsWidget(
                                              commissionDetails:
                                                  listViewCommissionsRecord
                                                      .reference,
                                              indirectCommission: false,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      listViewCommissionsRecord
                                                          .projectName,
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 24,
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 10, 0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .rupeeSign,
                                                      color: FlutterFlowTheme
                                                          .textColor,
                                                      size: 24,
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      listViewCommissionsRecord
                                                          .commissionAmount
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.title1,
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                          'relative',
                                                          listViewCommissionsRecord
                                                              .commissionCreated),
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).animated([
                                animationsMap['listViewOnPageLoadAnimation1']
                              ]);
                            },
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                child: Text(
                                  'Indirect Commissions',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          StreamBuilder<List<CommissionsRecord>>(
                            stream: queryCommissionsRecord(
                              queryBuilder: (commissionsRecord) =>
                                  commissionsRecord
                                      .where('commissionUser',
                                          isEqualTo: currentUserReference)
                                      .where('commissionType',
                                          isEqualTo: 'Indirect'),
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
                              List<CommissionsRecord>
                                  listViewCommissionsRecordList = snapshot.data;
                              if (listViewCommissionsRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/NoSale.JPG',
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewCommissionsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCommissionsRecord =
                                      listViewCommissionsRecordList[
                                          listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 12),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CommissionDetailsWidget(
                                              commissionDetails:
                                                  listViewCommissionsRecord
                                                      .reference,
                                              indirectCommission: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      listViewCommissionsRecord
                                                          .projectName,
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 24,
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 10, 0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .rupeeSign,
                                                      color: FlutterFlowTheme
                                                          .textColor,
                                                      size: 24,
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      listViewCommissionsRecord
                                                          .commissionAmount
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.title1,
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                          'relative',
                                                          listViewCommissionsRecord
                                                              .commissionCreated),
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).animated([
                                animationsMap['listViewOnPageLoadAnimation2']
                              ]);
                            },
                          ),
                        ],
                      ),
                    ],
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
