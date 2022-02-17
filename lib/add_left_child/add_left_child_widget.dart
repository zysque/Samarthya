import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../my_hierarchy/my_hierarchy_widget.dart';
import '../update_hierarchy/update_hierarchy_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddLeftChildWidget extends StatefulWidget {
  const AddLeftChildWidget({
    Key key,
    this.userSize,
    this.addDelink,
    this.userHierarchyRef,
  }) : super(key: key);

  final int userSize;
  final bool addDelink;
  final DocumentReference userHierarchyRef;

  @override
  _AddLeftChildWidgetState createState() => _AddLeftChildWidgetState();
}

class _AddLeftChildWidgetState extends State<AddLeftChildWidget> {
  String uDuserCodeValue;
  TextEditingController referralController;
  String uHuserCodeValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    referralController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 40),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Child Heirarchy',
                  style: FlutterFlowTheme.of(context).title1,
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    buttonSize: 48,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).textColor,
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
          if ((widget.userSize) > 0)
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!(widget.addDelink) ?? true)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                          height: 530,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).darkBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<UserHierarchiesRecord>>(
                                  stream: queryUserHierarchiesRecord(
                                    queryBuilder: (userHierarchiesRecord) =>
                                        userHierarchiesRecord
                                            .where('hasParent',
                                                isEqualTo: false)
                                            .where('referralParent',
                                                isEqualTo:
                                                    currentUserReference),
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
                                    List<UserHierarchiesRecord>
                                        uHuserCodeUserHierarchiesRecordList =
                                        snapshot.data;
                                    return FlutterFlowDropDown(
                                      options:
                                          uHuserCodeUserHierarchiesRecordList
                                              .map((e) => e.userCode)
                                              .toList()
                                              .toList(),
                                      onChanged: (val) =>
                                          setState(() => uHuserCodeValue = val),
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                          ),
                                      hintText: 'Select available user...',
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2,
                                      borderColor:
                                          FlutterFlowTheme.of(context).grayDark,
                                      borderWidth: 2,
                                      borderRadius: 8,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Please choose desired child from dropdown. \nVerify selected user\'s informations below.',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayLight,
                                              fontSize: 16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where('userCode',
                                              isEqualTo: uHuserCodeValue),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          userDetailsUsersRecordList =
                                          snapshot.data;
                                      final userDetailsUsersRecord =
                                          userDetailsUsersRecordList.isNotEmpty
                                              ? userDetailsUsersRecordList.first
                                              : null;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),
                                                  child: Container(
                                                    width: 80,
                                                    height: 80,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      userDetailsUsersRecord
                                                          .photoUrl,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 5, 0),
                                                  child: Text(
                                                    userDetailsUsersRecord
                                                        .userTitle,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                ),
                                                Text(
                                                  userDetailsUsersRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 8, 0, 0),
                                                  child: Text(
                                                    userDetailsUsersRecord.dob,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 8, 0, 0),
                                                  child: Text(
                                                    userDetailsUsersRecord
                                                        .phoneNumber,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 8, 0, 0),
                                                  child: Text(
                                                    userDetailsUsersRecord
                                                        .email,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 8, 0, 0),
                                                child: AutoSizeText(
                                                  userDetailsUsersRecord
                                                      .address,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: StreamBuilder<UserHierarchiesRecord>(
                          stream: UserHierarchiesRecord.getDocument(
                              widget.userHierarchyRef),
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
                            final actionsUserHierarchiesRecord = snapshot.data;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<UserHierarchiesRecord>>(
                                  stream: queryUserHierarchiesRecord(
                                    queryBuilder: (userHierarchiesRecord) =>
                                        userHierarchiesRecord.where('userCode',
                                            isEqualTo: uHuserCodeValue),
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
                                    List<UserHierarchiesRecord>
                                        addUserHierarchiesRecordList =
                                        snapshot.data;
                                    final addUserHierarchiesRecord =
                                        addUserHierarchiesRecordList.isNotEmpty
                                            ? addUserHierarchiesRecordList.first
                                            : null;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        final userHierarchiesUpdateData =
                                            createUserHierarchiesRecordData(
                                          leftChildRef: addUserHierarchiesRecord
                                              .hierarchyUser,
                                          hasLeft: true,
                                        );
                                        await widget.userHierarchyRef
                                            .update(userHierarchiesUpdateData);
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateHierarchyWidget(
                                              childHierarchyRef:
                                                  addUserHierarchiesRecord
                                                      .reference,
                                              parentRef:
                                                  actionsUserHierarchiesRecord
                                                      .hierarchyUser,
                                            ),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: 'Add Child',
                                      options: FFButtonOptions(
                                        width: 250,
                                        height: 70,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        textStyle:
                                            FlutterFlowTheme.of(context).title1,
                                        elevation: 0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .grayDark,
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
                if (widget.addDelink ?? true)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                          height: 590,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).darkBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ToggleIcon(
                                          onPressed: () async {
                                            setState(() =>
                                                FFAppState().hasReferral =
                                                    !FFAppState().hasReferral);
                                          },
                                          value: FFAppState().hasReferral,
                                          onIcon: Icon(
                                            Icons.check_box,
                                            color: FlutterFlowTheme.of(context)
                                                .errorRed,
                                            size: 30,
                                          ),
                                          offIcon: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Colors.purple,
                                            size: 30,
                                          ),
                                        ),
                                        if (FFAppState().hasReferral ?? true)
                                          Expanded(
                                            child: TextFormField(
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                'referralController',
                                                Duration(milliseconds: 20),
                                                () => setState(() {}),
                                              ),
                                              controller: referralController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Referral ID',
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0x98FFFFFF),
                                                    ),
                                                hintText: 'Enter Referral ID',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0x98FFFFFF),
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayDark,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayDark,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .darkBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 24, 20, 24),
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    if (FFAppState().hasReferral ?? true)
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                        'userCode',
                                                        isEqualTo:
                                                            referralController
                                                                .text),
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
                                                    validateUsersRecordList =
                                                    snapshot.data;
                                                final validateUsersRecord =
                                                    validateUsersRecordList
                                                            .isNotEmpty
                                                        ? validateUsersRecordList
                                                            .first
                                                        : null;
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() => FFAppState()
                                                        .validated = (FFAppState()
                                                            .hasReferral) ==
                                                        (validateUsersRecord !=
                                                            null));
                                                    if (FFAppState()
                                                        .validated) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Correct Referral ID'),
                                                            content: Text(
                                                                'The entered referral ID is corrrect, referral user is associated with us.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                    if (!(FFAppState()
                                                        .validated)) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Wrong Referral ID'),
                                                            content: Text(
                                                                'The referral User doesn\'t exist, Please correct the referral ID.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                    if (!(FFAppState()
                                                        .validated)) {
                                                      setState(() {
                                                        referralController
                                                            .clear();
                                                      });
                                                    }
                                                  },
                                                  text: 'Validate',
                                                  options: FFButtonOptions(
                                                    width: 74,
                                                    height: 20,
                                                    color: Color(0xFF78A638),
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
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
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child:
                                      StreamBuilder<List<DelinkedUsersRecord>>(
                                    stream: queryDelinkedUsersRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: SpinKitPumpingHeart(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<DelinkedUsersRecord>
                                          uDuserCodeDelinkedUsersRecordList =
                                          snapshot.data;
                                      return FlutterFlowDropDown(
                                        options:
                                            uDuserCodeDelinkedUsersRecordList
                                                .map((e) => e.userCode)
                                                .toList()
                                                .toList(),
                                        onChanged: (val) => setState(
                                            () => uDuserCodeValue = val),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 70,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                            ),
                                        hintText: 'Select available user...',
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        elevation: 2,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .grayDark,
                                        borderWidth: 2,
                                        borderRadius: 8,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Please choose desired child from dropdown. \nVerify selected user\'s informations below.',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayLight,
                                              fontSize: 16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where('userCode',
                                              isEqualTo: uDuserCodeValue),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          userDetailsUsersRecordList =
                                          snapshot.data;
                                      final userDetailsUsersRecord =
                                          userDetailsUsersRecordList.isNotEmpty
                                              ? userDetailsUsersRecordList.first
                                              : null;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 2, 2, 2),
                                                  child: Container(
                                                    width: 80,
                                                    height: 80,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      userDetailsUsersRecord
                                                          .photoUrl,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 5, 0),
                                                  child: Text(
                                                    userDetailsUsersRecord
                                                        .userTitle,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                ),
                                                Text(
                                                  userDetailsUsersRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 8, 0, 0),
                                                  child: Text(
                                                    userDetailsUsersRecord.dob,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 8, 0, 0),
                                                  child: Text(
                                                    userDetailsUsersRecord
                                                        .phoneNumber,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 8, 0, 0),
                                                  child: Text(
                                                    userDetailsUsersRecord
                                                        .email,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 8, 0, 0),
                                                child: AutoSizeText(
                                                  userDetailsUsersRecord
                                                      .address,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: StreamBuilder<UserHierarchiesRecord>(
                          stream: UserHierarchiesRecord.getDocument(
                              widget.userHierarchyRef),
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
                            final actionsUserHierarchiesRecord = snapshot.data;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<DelinkedUsersRecord>>(
                                  stream: queryDelinkedUsersRecord(
                                    queryBuilder: (delinkedUsersRecord) =>
                                        delinkedUsersRecord.where('userCode',
                                            isEqualTo: uDuserCodeValue),
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
                                    List<DelinkedUsersRecord>
                                        columnDelinkedUsersRecordList =
                                        snapshot.data;
                                    final columnDelinkedUsersRecord =
                                        columnDelinkedUsersRecordList.isNotEmpty
                                            ? columnDelinkedUsersRecordList
                                                .first
                                            : null;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState().hasReferral ?? true)
                                          StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord.where('userCode',
                                                      isEqualTo:
                                                          referralController
                                                              .text),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 40,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  addUsersRecordList =
                                                  snapshot.data;
                                              final addUsersRecord =
                                                  addUsersRecordList.isNotEmpty
                                                      ? addUsersRecordList.first
                                                      : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  final userHierarchiesCreateData =
                                                      createUserHierarchiesRecordData(
                                                    hierarchyUser:
                                                        columnDelinkedUsersRecord
                                                            .userRef,
                                                    parentRef:
                                                        actionsUserHierarchiesRecord
                                                            .hierarchyUser,
                                                    hasParent: true,
                                                    hasReferral: true,
                                                    referralParent:
                                                        addUsersRecord
                                                            .reference,
                                                    hasLeft: false,
                                                    hasRight: false,
                                                    userCode:
                                                        columnDelinkedUsersRecord
                                                            .userCode,
                                                  );
                                                  await UserHierarchiesRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          userHierarchiesCreateData);

                                                  final userHierarchiesUpdateData =
                                                      createUserHierarchiesRecordData(
                                                    leftChildRef:
                                                        columnDelinkedUsersRecord
                                                            .userRef,
                                                    hasLeft: true,
                                                  );
                                                  await widget.userHierarchyRef
                                                      .update(
                                                          userHierarchiesUpdateData);
                                                  await columnDelinkedUsersRecord
                                                      .reference
                                                      .delete();
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHierarchyWidget(
                                                        userProfile:
                                                            currentUserReference,
                                                      ),
                                                    ),
                                                    (r) => false,
                                                  );
                                                },
                                                text: 'Add Child',
                                                options: FFButtonOptions(
                                                  width: 250,
                                                  height: 70,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .title1,
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayDark,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 8,
                                                ),
                                              );
                                            },
                                          ),
                                        if (!(FFAppState().hasReferral) ?? true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              final userHierarchiesCreateData =
                                                  createUserHierarchiesRecordData(
                                                hierarchyUser:
                                                    columnDelinkedUsersRecord
                                                        .userRef,
                                                parentRef:
                                                    actionsUserHierarchiesRecord
                                                        .hierarchyUser,
                                                hasParent: true,
                                                hasReferral: true,
                                                referralParent:
                                                    currentUserReference,
                                                hasLeft: false,
                                                hasRight: false,
                                                userCode: '',
                                              );
                                              await UserHierarchiesRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      userHierarchiesCreateData);

                                              final userHierarchiesUpdateData =
                                                  createUserHierarchiesRecordData(
                                                leftChildRef:
                                                    columnDelinkedUsersRecord
                                                        .userRef,
                                                hasLeft: true,
                                              );
                                              await widget.userHierarchyRef
                                                  .update(
                                                      userHierarchiesUpdateData);
                                              await columnDelinkedUsersRecord
                                                  .reference
                                                  .delete();
                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHierarchyWidget(
                                                    userProfile:
                                                        currentUserReference,
                                                  ),
                                                ),
                                                (r) => false,
                                              );
                                            },
                                            text: 'Add Child',
                                            options: FFButtonOptions(
                                              width: 300,
                                              height: 70,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .title1,
                                              elevation: 0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
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
              ],
            ),
          if ((widget.userSize) == 0)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'No referral available or no user to add as your child.\n\nfor more information contact your Administrator.',
                    style: FlutterFlowTheme.of(context).title2,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
