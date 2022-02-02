import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminConstantsWidget extends StatefulWidget {
  const AdminConstantsWidget({Key key}) : super(key: key);

  @override
  _AdminConstantsWidgetState createState() => _AdminConstantsWidgetState();
}

class _AdminConstantsWidgetState extends State<AdminConstantsWidget> {
  String dropDownValue;
  double sliderValue1;
  double sliderValue2;
  double sliderValue3;
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
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Admin Constants',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.textColor,
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
              List<AdminConstsRecord> columnAdminConstsRecordList =
                  snapshot.data;
              final columnAdminConstsRecord =
                  columnAdminConstsRecordList.isNotEmpty
                      ? columnAdminConstsRecordList.first
                      : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Direct Commission Percentage',
                          style: FlutterFlowTheme.title3.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.grayDark,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Container(
                            width: 315,
                            child: Slider(
                              activeColor: FlutterFlowTheme.primaryColor,
                              inactiveColor: Color(0xFF9E9E9E),
                              min: 0,
                              max: 100,
                              value: sliderValue1 ??=
                                  columnAdminConstsRecord.directPer,
                              label: sliderValue1.toString(),
                              divisions: 100,
                              onChanged: (newValue) {
                                setState(() => sliderValue1 = newValue);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Text(
                            'Indirect Commission Percentage',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayDark,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Container(
                            width: 315,
                            child: Slider(
                              activeColor: FlutterFlowTheme.primaryColor,
                              inactiveColor: Color(0xFF9E9E9E),
                              min: 0,
                              max: 100,
                              value: sliderValue2 ??=
                                  columnAdminConstsRecord.indirectPer,
                              label: sliderValue2.toString(),
                              divisions: 100,
                              onChanged: (newValue) {
                                setState(() => sliderValue2 = newValue);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Text(
                            'Day of EMI Payment',
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayDark,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Container(
                            width: 315,
                            child: Slider(
                              activeColor: FlutterFlowTheme.primaryColor,
                              inactiveColor: Color(0xFF9E9E9E),
                              min: 1,
                              max: 28,
                              value: sliderValue3 ??=
                                  columnAdminConstsRecord.emiPaymentDay,
                              label: sliderValue3.toString(),
                              divisions: 27,
                              onChanged: (newValue) {
                                setState(() => sliderValue3 = newValue);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Want to make a user admin click checkob',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5, 10, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ToggleIcon(
                                      onPressed: () async {
                                        setState(() => FFAppState().addAdmin =
                                            !FFAppState().addAdmin);
                                      },
                                      value: FFAppState().addAdmin,
                                      onIcon: Icon(
                                        Icons.check_box,
                                        color: Color(0xFFA5325A),
                                        size: 25,
                                      ),
                                      offIcon: Icon(
                                        Icons.check_box_outline_blank,
                                        color: Color(0xFFA5ADE1),
                                        size: 25,
                                      ),
                                    ),
                                    if (FFAppState().addAdmin ?? true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(),
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
                                            List<UsersRecord>
                                                dropDownUsersRecordList =
                                                snapshot.data;
                                            return FlutterFlowDropDown(
                                              options: [].toList(),
                                              onChanged: (val) => setState(
                                                  () => dropDownValue = val),
                                              width: 265,
                                              height: 50,
                                              textStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.textColor,
                                              ),
                                              hintText: 'Select User',
                                              fillColor:
                                                  FlutterFlowTheme.background,
                                              elevation: 2,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0,
                                              borderRadius: 0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 12, 4),
                                              hidesUnderline: true,
                                            );
                                          },
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord.where(
                                'display_name',
                                isEqualTo: dropDownValue),
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
                            List<UsersRecord> saveButtonUsersRecordList =
                                snapshot.data;
                            final saveButtonUsersRecord =
                                saveButtonUsersRecordList.isNotEmpty
                                    ? saveButtonUsersRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                final adminConstsUpdateData = {
                                  ...createAdminConstsRecordData(
                                    directPer: sliderValue1,
                                    indirectPer: sliderValue2,
                                    emiPaymentDay: sliderValue3,
                                    lastModified: getCurrentTimestamp,
                                  ),
                                  'adminUsers': FieldValue.arrayUnion(
                                      [saveButtonUsersRecord.reference]),
                                };
                                await columnAdminConstsRecord.reference
                                    .update(adminConstsUpdateData);
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'HomePage'),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Save',
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
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
