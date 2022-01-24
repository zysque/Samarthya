import '../admin_delete_sale/admin_delete_sale_widget.dart';
import '../admin_sale_process/admin_sale_process_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../modify_sale/modify_sale_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSaleDetailsWidget extends StatefulWidget {
  const AdminSaleDetailsWidget({
    Key key,
    this.saleDetails,
    this.processed,
  }) : super(key: key);

  final DocumentReference saleDetails;
  final bool processed;

  @override
  _AdminSaleDetailsWidgetState createState() => _AdminSaleDetailsWidgetState();
}

class _AdminSaleDetailsWidgetState extends State<AdminSaleDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SalesRecord>(
      stream: SalesRecord.getDocument(widget.saleDetails),
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
        final adminSaleDetailsSalesRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.textColor,
                size: 32,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  buttonSize: 48,
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: FlutterFlowTheme.textColor,
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 220),
                        reverseDuration: Duration(milliseconds: 220),
                        child: AdminDeleteSaleWidget(
                          saleDetails: widget.saleDetails,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.primaryColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text(
                                  adminSaleDetailsSalesRecord.projectName,
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                              child: FaIcon(
                                FontAwesomeIcons.rupeeSign,
                                color: FlutterFlowTheme.textColor,
                                size: 36,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                adminSaleDetailsSalesRecord.saleAmount
                                    .toString(),
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 36,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateTimeFormat('relative',
                                  adminSaleDetailsSalesRecord.saleCreated),
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Lexend Deca',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.background,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Sale Logged',
                                style: FlutterFlowTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                dateTimeFormat('EEEE',
                                    adminSaleDetailsSalesRecord.saleCreated),
                                style: FlutterFlowTheme.subtitle2,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                child: Text(
                                  dateTimeFormat('yMMMd',
                                      adminSaleDetailsSalesRecord.saleCreated),
                                  style: FlutterFlowTheme.subtitle2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  dateTimeFormat('jms',
                                      adminSaleDetailsSalesRecord.saleCreated),
                                  style: FlutterFlowTheme.subtitle2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                adminSaleDetailsSalesRecord.saleUser),
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
                              final rowUsersRecord = snapshot.data;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Logged By',
                                    style: FlutterFlowTheme.subtitle1,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      rowUsersRecord.displayName,
                                      style: FlutterFlowTheme.subtitle1,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      decoration: BoxDecoration(),
                                      child: AutoSizeText(
                                        adminSaleDetailsSalesRecord.saleDesc,
                                        style: FlutterFlowTheme.subtitle2,
                                      ),
                                    ),
                                  ),
                                ],
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: StreamBuilder<List<CalculationListRecord>>(
                          stream: queryCalculationListRecord(
                            queryBuilder: (calculationListRecord) =>
                                calculationListRecord.where('userRef',
                                    isEqualTo:
                                        adminSaleDetailsSalesRecord.saleUser),
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
                            List<CalculationListRecord>
                                rowCalculationListRecordList = snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final rowCalculationListRecord =
                                rowCalculationListRecordList.isNotEmpty
                                    ? rowCalculationListRecordList.first
                                    : null;
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 50, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ModifySaleWidget(
                                            saleDetails: widget.saleDetails,
                                          ),
                                        ),
                                        (r) => false,
                                      );
                                    },
                                    text: 'Modify',
                                    options: FFButtonOptions(
                                      width: 100,
                                      height: 40,
                                      color: FlutterFlowTheme.grayLight,
                                      textStyle:
                                          FlutterFlowTheme.title1.override(
                                        fontFamily: 'Lexend Deca',
                                        fontSize: 20,
                                      ),
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
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
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<AdminConstsRecord>
                                          processAdminConstsRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final processAdminConstsRecord =
                                          processAdminConstsRecordList
                                                  .isNotEmpty
                                              ? processAdminConstsRecordList
                                                  .first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          final commissionsCreateData =
                                              createCommissionsRecordData(
                                            projectName:
                                                adminSaleDetailsSalesRecord
                                                    .projectName,
                                            commissionAmount:
                                                functions.getCommission(
                                                    processAdminConstsRecord
                                                        .directPer,
                                                    adminSaleDetailsSalesRecord
                                                        .saleAmount),
                                            commissionType: 'Direct',
                                            commissionCreated:
                                                getCurrentTimestamp,
                                            commissionUser:
                                                adminSaleDetailsSalesRecord
                                                    .saleUser,
                                          );
                                          await CommissionsRecord.collection
                                              .doc()
                                              .set(commissionsCreateData);

                                          final calculationListUpdateData =
                                              createCalculationListRecordData(
                                            unProcessedAmount:
                                                functions.getDiff(
                                                    rowCalculationListRecord
                                                        .unProcessedAmount,
                                                    adminSaleDetailsSalesRecord
                                                        .saleAmount),
                                            processedAmount: functions.getSum(
                                                rowCalculationListRecord
                                                    .processedAmount,
                                                adminSaleDetailsSalesRecord
                                                    .saleAmount),
                                            directCommissionAmount:
                                                functions.getSum(
                                                    rowCalculationListRecord
                                                        .directCommissionAmount,
                                                    functions.getCommission(
                                                        processAdminConstsRecord
                                                            .directPer,
                                                        adminSaleDetailsSalesRecord
                                                            .saleAmount)),
                                          );
                                          await rowCalculationListRecord
                                              .reference
                                              .update(
                                                  calculationListUpdateData);
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminSaleProcessWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                        text: 'Process',
                                        options: FFButtonOptions(
                                          width: 100,
                                          height: 40,
                                          color: FlutterFlowTheme.grayLight,
                                          textStyle:
                                              FlutterFlowTheme.title1.override(
                                            fontFamily: 'Lexend Deca',
                                            fontSize: 20,
                                          ),
                                          elevation: 0,
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
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'Tap above to remove this sale',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0x43000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
