import '../admin_create_projects_plan/admin_create_projects_plan_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../project_details/project_details_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminModifyProjectsWidget extends StatefulWidget {
  const AdminModifyProjectsWidget({
    Key key,
    this.projectDetails,
  }) : super(key: key);

  final DocumentReference projectDetails;

  @override
  _AdminModifyProjectsWidgetState createState() =>
      _AdminModifyProjectsWidgetState();
}

class _AdminModifyProjectsWidgetState extends State<AdminModifyProjectsWidget>
    with TickerProviderStateMixin {
  TextEditingController descriptionController;
  TextEditingController projectCityController;
  TextEditingController projectNameController;
  bool statusValue;
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: StreamBuilder<ProjectsRecord>(
        stream: ProjectsRecord.getDocument(widget.projectDetails),
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
          final adminModifyProjectsProjectsRecord = snapshot.data;
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
                'Modify Project',
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
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.darkBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: TextFormField(
                                  controller: projectNameController ??=
                                      TextEditingController(
                                    text: adminModifyProjectsProjectsRecord
                                        .projectName,
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
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
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 24, 0, 24),
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
                                ).animated([
                                  animationsMap['textFieldOnPageLoadAnimation1']
                                ]),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: TextFormField(
                                  controller: projectCityController ??=
                                      TextEditingController(
                                    text: adminModifyProjectsProjectsRecord
                                        .projectCity,
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
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
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 24, 0, 24),
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
                                ).animated([
                                  animationsMap['textFieldOnPageLoadAnimation2']
                                ]),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: TextFormField(
                                  controller: descriptionController ??=
                                      TextEditingController(
                                    text: adminModifyProjectsProjectsRecord
                                        .projectDesc,
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
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
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 40, 24, 0),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.textColor,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: SwitchListTile(
                                    value: statusValue ??=
                                        adminModifyProjectsProjectsRecord
                                            .active,
                                    onChanged: (newValue) =>
                                        setState(() => statusValue = newValue),
                                    title: Text(
                                      'Active',
                                      style: FlutterFlowTheme.title3,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeTrackColor:
                                        FlutterFlowTheme.background,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'For Adding new Plans to your Project click on Add Plan below.',
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.errorRed,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdminCreateProjectsPlanWidget(
                                          projectRef: widget.projectDetails,
                                        ),
                                      ),
                                    );
                                  },
                                  text: 'Add Plan',
                                  options: FFButtonOptions(
                                    width: 180,
                                    height: 60,
                                    color: FlutterFlowTheme.grayLight,
                                    textStyle: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFC5E1A5),
                                    ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.grayDark,
                                      width: 2,
                                    ),
                                    borderRadius: 12,
                                  ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                          final projectsUpdateData = createProjectsRecordData(
                            projectName: projectNameController?.text ?? '',
                            projectCity: projectCityController?.text ?? '',
                            projectDesc: descriptionController?.text ?? '',
                            lastModified: getCurrentTimestamp,
                            active: statusValue,
                          );
                          await adminModifyProjectsProjectsRecord.reference
                              .update(projectsUpdateData);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectDetailsWidget(),
                            ),
                          );
                        },
                        text: 'Modify',
                        options: FFButtonOptions(
                          width: 180,
                          height: 60,
                          color: FlutterFlowTheme.tertiaryColor,
                          textStyle: FlutterFlowTheme.title1,
                          elevation: 0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.grayDark,
                            width: 2,
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
