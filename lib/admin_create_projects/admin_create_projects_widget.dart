import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCreateProjectsWidget extends StatefulWidget {
  const AdminCreateProjectsWidget({Key key}) : super(key: key);

  @override
  _AdminCreateProjectsWidgetState createState() =>
      _AdminCreateProjectsWidgetState();
}

class _AdminCreateProjectsWidgetState extends State<AdminCreateProjectsWidget>
    with TickerProviderStateMixin {
  TextEditingController descriptionController;
  TextEditingController projectCityController;
  TextEditingController projectNameController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 40),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 40),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    descriptionController = TextEditingController();
    projectCityController = TextEditingController();
    projectNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
            'Create Project',
            style: FlutterFlowTheme.title1.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.primaryColor,
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: projectNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Project Name',
                            labelStyle: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                            hintText: 'Project Name',
                            hintStyle: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.background,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.background,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                          ),
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Lexend Deca',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Please enter an amount';
                            }

                            return null;
                          },
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation1']]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: projectCityController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Project City',
                            labelStyle: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                            hintText: 'Project City',
                            hintStyle: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.background,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.background,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                          ),
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Lexend Deca',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Please enter City';
                            }

                            return null;
                          },
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation2']]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: descriptionController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Project Description',
                            labelStyle: FlutterFlowTheme.bodyText1,
                            hintText: 'Project  Description',
                            hintStyle: FlutterFlowTheme.bodyText1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.background,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.background,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 40, 24, 0),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.textColor,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    if (!formKey.currentState.validate()) {
                      return;
                    }
                    final projectsCreateData = createProjectsRecordData(
                      projectName: projectNameController.text,
                      projectCity: projectCityController.text,
                      projectDesc: descriptionController.text,
                      lastModified: getCurrentTimestamp,
                    );
                    await ProjectsRecord.collection
                        .doc()
                        .set(projectsCreateData);
                    Navigator.pop(context);
                  },
                  text: 'Create',
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
                Text(
                  'Tap above to complete request',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0x43000000),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
