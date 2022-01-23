import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../update_hierarchy/update_hierarchy_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRightChildWidget extends StatefulWidget {
  const AddRightChildWidget({
    Key key,
    this.userSize,
  }) : super(key: key);

  final int userSize;

  @override
  _AddRightChildWidgetState createState() => _AddRightChildWidgetState();
}

class _AddRightChildWidgetState extends State<AddRightChildWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: StreamBuilder<List<UserHierarchiesRecord>>(
        stream: queryUserHierarchiesRecord(
          queryBuilder: (userHierarchiesRecord) => userHierarchiesRecord
              .where('hierarchyUser', isEqualTo: currentUserReference),
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
          List<UserHierarchiesRecord> columnUserHierarchiesRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final columnUserHierarchiesRecord =
              columnUserHierarchiesRecordList.isNotEmpty
                  ? columnUserHierarchiesRecordList.first
                  : null;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ((widget.userSize) > 0)
                Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.darkBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add Child Heirarchy',
                                  style: FlutterFlowTheme.title1,
                                ),
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.background,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.textColor,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: StreamBuilder<List<DelinkedUsersRecord>>(
                              stream: queryDelinkedUsersRecord(),
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
                                List<DelinkedUsersRecord>
                                    dropDownDelinkedUsersRecordList =
                                    snapshot.data;
                                return FlutterFlowDropDown(
                                  options: dropDownDelinkedUsersRecordList
                                      .map((e) => e.userName)
                                      .toList()
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => dropDownValue = val),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  textStyle:
                                      FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 20,
                                  ),
                                  hintText: 'Select available users...',
                                  fillColor: FlutterFlowTheme.darkBackground,
                                  elevation: 2,
                                  borderColor: FlutterFlowTheme.background,
                                  borderWidth: 2,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  hidesUnderline: true,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Please choose desired child from dropdown. \nVerify selected user\'s informations below.',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.grayLight,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: StreamBuilder<List<DelinkedUsersRecord>>(
                              stream: queryDelinkedUsersRecord(
                                queryBuilder: (delinkedUsersRecord) =>
                                    delinkedUsersRecord.where('userName',
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
                                List<DelinkedUsersRecord>
                                    mColumnDelinkedUsersRecordList =
                                    snapshot.data;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data.isEmpty) {
                                  return Container();
                                }
                                final mColumnDelinkedUsersRecord =
                                    mColumnDelinkedUsersRecordList.isNotEmpty
                                        ? mColumnDelinkedUsersRecordList.first
                                        : null;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          mColumnDelinkedUsersRecord.userRef),
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
                                        final pColumnUsersRecord =
                                            snapshot.data;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(100, 0, 0, 0),
                                                  child: Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2, 2, 2, 2),
                                                      child: Container(
                                                        width: 80,
                                                        height: 80,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          pColumnUsersRecord
                                                              .photoUrl,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 5, 0),
                                                    child: Text(
                                                      pColumnUsersRecord
                                                          .userTitle,
                                                      style: FlutterFlowTheme
                                                          .title3,
                                                    ),
                                                  ),
                                                  Text(
                                                    pColumnUsersRecord
                                                        .displayName,
                                                    style:
                                                        FlutterFlowTheme.title3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 8, 0, 0),
                                                    child: Text(
                                                      pColumnUsersRecord.dob,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: FlutterFlowTheme
                                                            .textColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 8, 0, 0),
                                                    child: Text(
                                                      pColumnUsersRecord
                                                          .phoneNumber,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: FlutterFlowTheme
                                                            .textColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 8, 0, 0),
                                                    child: Text(
                                                      pColumnUsersRecord.email,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: FlutterFlowTheme
                                                            .textColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Wrap(
                                                    spacing: 0,
                                                    runSpacing: 0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 8, 0, 0),
                                                        child: Text(
                                                          pColumnUsersRecord
                                                              .address,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color:
                                                                FlutterFlowTheme
                                                                    .textColor,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
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
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: StreamBuilder<List<DelinkedUsersRecord>>(
                  stream: queryDelinkedUsersRecord(
                    queryBuilder: (delinkedUsersRecord) => delinkedUsersRecord
                        .where('userName', isEqualTo: dropDownValue),
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
                    List<DelinkedUsersRecord> row1DelinkedUsersRecordList =
                        snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final row1DelinkedUsersRecord =
                        row1DelinkedUsersRecordList.isNotEmpty
                            ? row1DelinkedUsersRecordList.first
                            : null;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final userHierarchiesCreateData =
                                    createUserHierarchiesRecordData(
                                  hierarchyUser:
                                      row1DelinkedUsersRecord.userRef,
                                  userEmail: row1DelinkedUsersRecord.userEmail,
                                  parentEmail:
                                      columnUserHierarchiesRecord.userEmail,
                                );
                                await UserHierarchiesRecord.collection
                                    .doc()
                                    .set(userHierarchiesCreateData);

                                final childHierarchiesCreateData =
                                    createChildHierarchiesRecordData(
                                  childRef: row1DelinkedUsersRecord.userRef,
                                  childEmail: row1DelinkedUsersRecord.userEmail,
                                  parentRef:
                                      columnUserHierarchiesRecord.hierarchyUser,
                                  parentLeg: 'Right',
                                );
                                await ChildHierarchiesRecord.collection
                                    .doc()
                                    .set(childHierarchiesCreateData);
                                await row1DelinkedUsersRecord.reference
                                    .delete();
                                final userHierarchiesUpdateData =
                                    createUserHierarchiesRecordData(
                                  hasRight: true,
                                );
                                await columnUserHierarchiesRecord.reference
                                    .update(userHierarchiesUpdateData);
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateHierarchyWidget(
                                      childRef: row1DelinkedUsersRecord.userRef,
                                    ),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Add Child',
                              options: FFButtonOptions(
                                width: 300,
                                height: 70,
                                color: FlutterFlowTheme.tertiaryColor,
                                textStyle: FlutterFlowTheme.title1,
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              if ((widget.userSize) == 0)
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Back',
                  options: FFButtonOptions(
                    width: 300,
                    height: 70,
                    color: FlutterFlowTheme.darkBackground,
                    textStyle: FlutterFlowTheme.title1,
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              Text(
                'Tap above to complete request',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0x43000000),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
