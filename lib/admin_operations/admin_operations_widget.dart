import '../admin_projects/admin_projects_widget.dart';
import '../admin_sale_process/admin_sale_process_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminOperationsWidget extends StatefulWidget {
  const AdminOperationsWidget({Key key}) : super(key: key);

  @override
  _AdminOperationsWidgetState createState() => _AdminOperationsWidgetState();
}

class _AdminOperationsWidgetState extends State<AdminOperationsWidget> {
  double sliderValue1;
  double sliderValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.darkBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Admin Operations',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.primaryColor,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.darkBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StreamBuilder<List<AdminConstsRecord>>(
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
                  List<AdminConstsRecord> containerAdminConstsRecordList =
                      snapshot.data;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final containerAdminConstsRecord =
                      containerAdminConstsRecordList.isNotEmpty
                          ? containerAdminConstsRecordList.first
                          : null;
                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Direct Commission Percentage',
                                        style: FlutterFlowTheme.title3.override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.grayDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 315,
                                        child: Slider(
                                          activeColor:
                                              FlutterFlowTheme.primaryColor,
                                          inactiveColor: Color(0xFF9E9E9E),
                                          min: 0,
                                          max: 100,
                                          value: sliderValue1 ??=
                                              containerAdminConstsRecord
                                                  .directPer,
                                          label: sliderValue1.toString(),
                                          divisions: 100,
                                          onChanged: (newValue) {
                                            setState(
                                                () => sliderValue1 = newValue);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Indirect Commission Percentage',
                                          style:
                                              FlutterFlowTheme.title3.override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.grayDark,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 315,
                                          child: Slider(
                                            activeColor:
                                                FlutterFlowTheme.primaryColor,
                                            inactiveColor: Color(0xFF9E9E9E),
                                            min: 0,
                                            max: 100,
                                            value: sliderValue2 ??=
                                                containerAdminConstsRecord
                                                    .indirectPer,
                                            label: sliderValue2.toString(),
                                            divisions: 100,
                                            onChanged: (newValue) {
                                              setState(() =>
                                                  sliderValue2 = newValue);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final adminConstsUpdateData =
                                      createAdminConstsRecordData(
                                    directPer: sliderValue1,
                                    indirectPer:
                                        containerAdminConstsRecord.indirectPer,
                                  );
                                  await containerAdminConstsRecord.reference
                                      .update(adminConstsUpdateData);
                                },
                                text: 'Save',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
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
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child:
                                    StreamBuilder<List<CalculationListRecord>>(
                                  stream: queryCalculationListRecord(),
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
                                    List<CalculationListRecord>
                                        projectsButtonCalculationListRecordList =
                                        snapshot.data;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdminProjectsWidget(),
                                          ),
                                        );
                                      },
                                      text: 'Projects',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 50,
                                        color: Color(0xFFE91E63),
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'Click on Projects to see and modify Projects.',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'The Commissions were last processed ',
                                      style: FlutterFlowTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      dateTimeFormat(
                                          'relative',
                                          containerAdminConstsRecord
                                              .lastProcessed),
                                      style: FlutterFlowTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child:
                                    StreamBuilder<List<CalculationListRecord>>(
                                  stream: queryCalculationListRecord(),
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
                                    List<CalculationListRecord>
                                        processButtonCalculationListRecordList =
                                        snapshot.data;
                                    return FFButtonWidget(
                                      onPressed: () async {
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
                                        width: 130,
                                        height: 50,
                                        color: FlutterFlowTheme.primaryColor,
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'Click on Process to consider the pending sales.',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
