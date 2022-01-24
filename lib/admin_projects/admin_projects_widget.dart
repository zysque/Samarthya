import '../admin_create_projects/admin_create_projects_widget.dart';
import '../admin_project_details/admin_project_details_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminProjectsWidget extends StatefulWidget {
  const AdminProjectsWidget({Key key}) : super(key: key);

  @override
  _AdminProjectsWidgetState createState() => _AdminProjectsWidgetState();
}

class _AdminProjectsWidgetState extends State<AdminProjectsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 150,
      delay: 90,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 26),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          'Projects',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.textColor,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: StreamBuilder<List<ProjectsRecord>>(
                      stream: queryProjectsRecord(
                        queryBuilder: (projectsRecord) =>
                            projectsRecord.orderBy('created', descending: true),
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
                        List<ProjectsRecord> listViewProjectsRecordList =
                            snapshot.data;
                        if (listViewProjectsRecordList.isEmpty) {
                          return Center(
                            child: Image.asset(
                              'assets/images/NoSale.JPG',
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewProjectsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewProjectsRecord =
                                listViewProjectsRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminProjectDetailsWidget(
                                        projectDetails:
                                            listViewProjectsRecord.reference,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                listViewProjectsRecord
                                                    .projectName,
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 24,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color:
                                                    FlutterFlowTheme.textColor,
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              listViewProjectsRecord
                                                  .projectCity,
                                              style: FlutterFlowTheme.title1,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                dateTimeFormat(
                                                    'relative',
                                                    listViewProjectsRecord
                                                        .created),
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).animated(
                            [animationsMap['listViewOnPageLoadAnimation']]);
                      },
                    ),
                  ),
                ],
              ),
            ),
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
                List<AdminConstsRecord> buttonAdminConstsRecordList =
                    snapshot.data;
                final buttonAdminConstsRecord =
                    buttonAdminConstsRecordList.isNotEmpty
                        ? buttonAdminConstsRecordList.first
                        : null;
                return FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminCreateProjectsWidget(),
                      ),
                    );
                  },
                  text: 'Create',
                  options: FFButtonOptions(
                    width: 150,
                    height: 40,
                    color: FlutterFlowTheme.primaryColor,
                    textStyle: FlutterFlowTheme.title1.override(
                      fontFamily: 'Lexend Deca',
                      fontSize: 20,
                    ),
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
        ),
      ),
    );
  }
}
