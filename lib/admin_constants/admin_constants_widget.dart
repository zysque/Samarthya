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
  TextEditingController comPPDaysController;
  double sliderValue1;
  double sliderValue2;
  double sliderValue3;
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
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Admin Constants',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).textColor,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).darkBackground,
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
                      color: FlutterFlowTheme.of(context).primaryColor,
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
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Direct Commission Percentage',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).grayDark,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Slider(
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryColor,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'Indirect Commission Percentage',
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).grayDark,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Slider(
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryColor,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'Day of EMI Payment',
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).grayDark,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Slider(
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryColor,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: TextFormField(
                              controller: comPPDaysController ??=
                                  TextEditingController(
                                text: columnAdminConstsRecord.comPPeriod
                                    .toString(),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText:
                                    'Indirect Commission  Processing Days',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                hintText:
                                    'Days between indirect commission processing',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    10, 4, 10, 4),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Want to make a user admin click checkbox',
                                  style: FlutterFlowTheme.of(context).bodyText1,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 0, 0),
                                          child:
                                              StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(),
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
                                              List<UsersRecord>
                                                  dropDownUsersRecordList =
                                                  snapshot.data;
                                              return FlutterFlowDropDown(
                                                options: dropDownUsersRecordList
                                                    .map((e) => e.email)
                                                    .toList()
                                                    .toList(),
                                                onChanged: (val) => setState(
                                                    () => dropDownValue = val),
                                                width: 265,
                                                height: 50,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                    ),
                                                hintText: 'Select User',
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .background,
                                                elevation: 2,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0,
                                                borderRadius: 8,
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where('email', isEqualTo: dropDownValue),
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
                                    comPPeriod: int.parse(
                                        comPPDaysController?.text ?? ''),
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
