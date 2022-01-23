import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../my_hierarchy/my_hierarchy_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateHierarchyWidget extends StatefulWidget {
  const UpdateHierarchyWidget({
    Key key,
    this.childRef,
  }) : super(key: key);

  final DocumentReference childRef;

  @override
  _UpdateHierarchyWidgetState createState() => _UpdateHierarchyWidgetState();
}

class _UpdateHierarchyWidgetState extends State<UpdateHierarchyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Heirarchy Updates',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.errorRed,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'Child has been added on respected leg of the user.\nYou will see the updated hierarchy on MyHierarchy now.\n\nWhat will change now:\n1. All the Sales made by added child  will now accumulate the indirect commission of the Parents in the hierarchy.\n2. The children will also get the direct commision for each sale made by themselves.',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFFC5E1A5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<List<UserHierarchiesRecord>>(
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
                            color: FlutterFlowTheme.primaryColor,
                            size: 40,
                          ),
                        ),
                      );
                    }
                    List<UserHierarchiesRecord> row2UserHierarchiesRecordList =
                        snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final row2UserHierarchiesRecord =
                        row2UserHierarchiesRecordList.isNotEmpty
                            ? row2UserHierarchiesRecordList.first
                            : null;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<UserHierarchiesRecord>>(
                          stream: queryUserHierarchiesRecord(
                            queryBuilder: (userHierarchiesRecord) =>
                                userHierarchiesRecord.where('hierarchyUser',
                                    isEqualTo: widget.childRef),
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
                            List<UserHierarchiesRecord>
                                buttonUserHierarchiesRecordList = snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final buttonUserHierarchiesRecord =
                                buttonUserHierarchiesRecordList.isNotEmpty
                                    ? buttonUserHierarchiesRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                final userHierarchiesUpdateData = {
                                  'hierarchicalParents':
                                      row2UserHierarchiesRecord
                                          .hierarchicalParents
                                          .toList(),
                                };
                                await buttonUserHierarchiesRecord.reference
                                    .update(userHierarchiesUpdateData);
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHierarchyWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Accept',
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
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Text(
            'Tap above to confirm and complete request',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Lexend Deca',
              color: Color(0x43000000),
            ),
          ),
        ],
      ),
    );
  }
}
