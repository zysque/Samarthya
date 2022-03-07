import '../add_left_child/add_left_child_widget.dart';
import '../addright_child/addright_child_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../my_hierarchy/my_hierarchy_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHierarchyWidget extends StatefulWidget {
  const MyHierarchyWidget({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _MyHierarchyWidgetState createState() => _MyHierarchyWidgetState();
}

class _MyHierarchyWidgetState extends State<MyHierarchyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userProfile),
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
        final myHierarchyUsersRecord = snapshot.data;
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
              'My Hierarchy',
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: Image.asset(
                      'assets/images/login_bg@2x.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                      List<AdminConstsRecord> fullColumnAdminConstsRecordList =
                          snapshot.data;
                      final fullColumnAdminConstsRecord =
                          fullColumnAdminConstsRecordList.isNotEmpty
                              ? fullColumnAdminConstsRecordList.first
                              : null;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                            child: StreamBuilder<List<UserHierarchiesRecord>>(
                              stream: queryUserHierarchiesRecord(
                                queryBuilder: (userHierarchiesRecord) =>
                                    userHierarchiesRecord.where('hierarchyUser',
                                        isEqualTo: widget.userProfile),
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
                                    parentInfoUserHierarchiesRecordList =
                                    snapshot.data;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data.isEmpty) {
                                  return Container();
                                }
                                final parentInfoUserHierarchiesRecord =
                                    parentInfoUserHierarchiesRecordList
                                            .isNotEmpty
                                        ? parentInfoUserHierarchiesRecordList
                                            .first
                                        : null;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (parentInfoUserHierarchiesRecord
                                              .hasParent ??
                                          true)
                                        StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              parentInfoUserHierarchiesRecord
                                                  .parentRef),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: SpinKitPumpingHeart(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 40,
                                                  ),
                                                ),
                                              );
                                            }
                                            final parentColumnUsersRecord =
                                                snapshot.data;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    if ((parentInfoUserHierarchiesRecord
                                                            .hierarchyUser) !=
                                                        (currentUserReference)) {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyHierarchyWidget(
                                                            userProfile:
                                                                parentColumnUsersRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 120,
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .darkBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Container(
                                                      width: 120,
                                                      height: 120,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          parentColumnUsersRecord
                                                              .photoUrl,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/finance-app-sample-kugwu4/assets/ijvuhvqbvns6/uiAvatar@2x.png',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  parentColumnUsersRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .darkBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        myHierarchyUsersRecord.photoUrl,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/finance-app-sample-kugwu4/assets/ijvuhvqbvns6/uiAvatar@2x.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  myHierarchyUsersRecord.displayName,
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<List<UserHierarchiesRecord>>(
                            stream: queryUserHierarchiesRecord(
                              queryBuilder: (userHierarchiesRecord) =>
                                  userHierarchiesRecord
                                      .where('hierarchyUser',
                                          isEqualTo: widget.userProfile)
                                      .where('hasParent', isEqualTo: true),
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
                                  childsInfoUserHierarchiesRecordList =
                                  snapshot.data;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data.isEmpty) {
                                return Container();
                              }
                              final childsInfoUserHierarchiesRecord =
                                  childsInfoUserHierarchiesRecordList.isNotEmpty
                                      ? childsInfoUserHierarchiesRecordList
                                          .first
                                      : null;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (childsInfoUserHierarchiesRecord
                                                    .hasLeft ??
                                                true)
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream: UsersRecord.getDocument(
                                                        childsInfoUserHierarchiesRecord
                                                            .leftChildRef),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final leftChildInfoUsersRecord =
                                                          snapshot.data;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            MyHierarchyWidget(
                                                                      userProfile:
                                                                          leftChildInfoUsersRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 120,
                                                                height: 120,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkBackground,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 120,
                                                                  height: 120,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      leftChildInfoUsersRecord
                                                                          .photoUrl,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/finance-app-sample-kugwu4/assets/ijvuhvqbvns6/uiAvatar@2x.png',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          AutoSizeText(
                                                            leftChildInfoUsersRecord
                                                                .displayName,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (childsInfoUserHierarchiesRecord
                                                    .hasRight ??
                                                true)
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream: UsersRecord.getDocument(
                                                        childsInfoUserHierarchiesRecord
                                                            .rightChildRef),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final rightChildInfoUsersRecord =
                                                          snapshot.data;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            MyHierarchyWidget(
                                                                      userProfile:
                                                                          rightChildInfoUsersRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 120,
                                                                height: 120,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkBackground,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 120,
                                                                  height: 120,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      rightChildInfoUsersRecord
                                                                          .photoUrl,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/finance-app-sample-kugwu4/assets/ijvuhvqbvns6/uiAvatar@2x.png',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          AutoSizeText(
                                                            rightChildInfoUsersRecord
                                                                .displayName,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    if (!(functions.getAndOutput(
                                            childsInfoUserHierarchiesRecord
                                                .hasLeft,
                                            childsInfoUserHierarchiesRecord
                                                .hasRight)) ??
                                        true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (!(childsInfoUserHierarchiesRecord
                                                                .hasLeft) ??
                                                            true)
                                                          StreamBuilder<
                                                              List<
                                                                  UserHierarchiesRecord>>(
                                                            stream:
                                                                queryUserHierarchiesRecord(
                                                              queryBuilder: (userHierarchiesRecord) => userHierarchiesRecord
                                                                  .where(
                                                                      'referralParent',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .where(
                                                                      'hasParent',
                                                                      isEqualTo:
                                                                          false),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 40,
                                                                    height: 40,
                                                                    child:
                                                                        SpinKitPumpingHeart(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 40,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<UserHierarchiesRecord>
                                                                  buttonLeftChildUserHierarchiesRecordList =
                                                                  snapshot.data;
                                                              return FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              AddLeftChildWidget(
                                                                        userSize:
                                                                            buttonLeftChildUserHierarchiesRecordList.length,
                                                                        addDelink:
                                                                            false,
                                                                        userHierarchyRef:
                                                                            childsInfoUserHierarchiesRecord.reference,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                text:
                                                                    'Add Left Child',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 122,
                                                                  height: 30,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                                  elevation: 2,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      8,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 20, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (!(childsInfoUserHierarchiesRecord
                                                                .hasRight) ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    UserHierarchiesRecord>>(
                                                              stream:
                                                                  queryUserHierarchiesRecord(
                                                                queryBuilder: (userHierarchiesRecord) => userHierarchiesRecord
                                                                    .where(
                                                                        'referralParent',
                                                                        isEqualTo:
                                                                            currentUserReference)
                                                                    .where(
                                                                        'hasParent',
                                                                        isEqualTo:
                                                                            false),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          SpinKitPumpingHeart(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            40,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UserHierarchiesRecord>
                                                                    buttonRightChildUserHierarchiesRecordList =
                                                                    snapshot
                                                                        .data;
                                                                return FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                AddrightChildWidget(
                                                                          userSize:
                                                                              buttonRightChildUserHierarchiesRecordList.length,
                                                                          addDelink:
                                                                              false,
                                                                          userHierarchyRef:
                                                                              childsInfoUserHierarchiesRecord.reference,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  text:
                                                                      'Add Right Child',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 122,
                                                                    height: 30,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .darkBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                    elevation:
                                                                        2,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        8,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (fullColumnAdminConstsRecord
                                                    .adminUsers
                                                    .toList()
                                                    .contains(
                                                        currentUserReference) ??
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Add any Delinked user to hierarchy',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFFC5E1A5),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (!(childsInfoUserHierarchiesRecord
                                                                          .hasLeft) ??
                                                                      true)
                                                                    StreamBuilder<
                                                                        List<
                                                                            DelinkedUsersRecord>>(
                                                                      stream:
                                                                          queryDelinkedUsersRecord(),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 40,
                                                                              height: 40,
                                                                              child: SpinKitPumpingHeart(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 40,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<DelinkedUsersRecord>
                                                                            buttonAdminLeftDelinkedUsersRecordList =
                                                                            snapshot.data;
                                                                        return FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            await Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => AddLeftChildWidget(
                                                                                  userSize: buttonAdminLeftDelinkedUsersRecordList.length,
                                                                                  addDelink: true,
                                                                                  userHierarchyRef: childsInfoUserHierarchiesRecord.reference,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          text:
                                                                              'Link user to Left',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130,
                                                                            height:
                                                                                40,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).darkBackground,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).bodyText2,
                                                                            elevation:
                                                                                2,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                8,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          20,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (!(childsInfoUserHierarchiesRecord
                                                                          .hasRight) ??
                                                                      true)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              DelinkedUsersRecord>>(
                                                                        stream:
                                                                            queryDelinkedUsersRecord(),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<DelinkedUsersRecord>
                                                                              buttonAdminRightDelinkedUsersRecordList =
                                                                              snapshot.data;
                                                                          return FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => AddrightChildWidget(
                                                                                    userSize: buttonAdminRightDelinkedUsersRecordList.length,
                                                                                    addDelink: true,
                                                                                    userHierarchyRef: childsInfoUserHierarchiesRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            text:
                                                                                'Link user to Right',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 138,
                                                                              height: 40,
                                                                              color: FlutterFlowTheme.of(context).darkBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyText2,
                                                                              elevation: 2,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: 8,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
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
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
