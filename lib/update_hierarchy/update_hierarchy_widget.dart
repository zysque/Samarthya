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
    this.childHierarchyRef,
    this.parentRef,
  }) : super(key: key);

  final DocumentReference childHierarchyRef;
  final DocumentReference parentRef;

  @override
  _UpdateHierarchyWidgetState createState() => _UpdateHierarchyWidgetState();
}

class _UpdateHierarchyWidgetState extends State<UpdateHierarchyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Heirarchy Updates',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.textColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
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
              height: MediaQuery.of(context).size.height * 0.7,
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
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'Child has been added on respected leg of the user.\nYou will see the updated hierarchy on MyHierarchy now.\n\nWhat will change now:\n1. All the Sales made by added child will now accumulate the indirect commission of the Parents in the hierarchy.\n2. The children will also get the direct commision for each sale made by themselves.',
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final userHierarchiesUpdateData =
                    createUserHierarchiesRecordData(
                  parentRef: widget.parentRef,
                  hasParent: true,
                );
                await widget.childHierarchyRef
                    .update(userHierarchiesUpdateData);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHierarchyWidget(
                      userProfile: currentUserReference,
                    ),
                  ),
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
                  color: FlutterFlowTheme.grayLight,
                  width: 1,
                ),
                borderRadius: 12,
              ),
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
