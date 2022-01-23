import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CommissionDetailsWidget extends StatefulWidget {
  const CommissionDetailsWidget({
    Key key,
    this.commissionDetails,
    this.indirectCommission,
  }) : super(key: key);

  final DocumentReference commissionDetails;
  final bool indirectCommission;

  @override
  _CommissionDetailsWidgetState createState() =>
      _CommissionDetailsWidgetState();
}

class _CommissionDetailsWidgetState extends State<CommissionDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CommissionsRecord>(
      stream: CommissionsRecord.getDocument(widget.commissionDetails),
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
        final commissionDetailsCommissionsRecord = snapshot.data;
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
                color: FlutterFlowTheme.textColor,
                size: 32,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.primaryColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text(
                                  commissionDetailsCommissionsRecord
                                      .projectName,
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                              child: FaIcon(
                                FontAwesomeIcons.rupeeSign,
                                color: FlutterFlowTheme.textColor,
                                size: 36,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                commissionDetailsCommissionsRecord
                                    .commissionAmount
                                    .toString(),
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 36,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateTimeFormat(
                                  'relative',
                                  commissionDetailsCommissionsRecord
                                      .commissionCreated),
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Lexend Deca',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.background,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Commission Processed',
                                style: FlutterFlowTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                dateTimeFormat(
                                    'EEEE',
                                    commissionDetailsCommissionsRecord
                                        .commissionCreated),
                                style: FlutterFlowTheme.subtitle2,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                child: Text(
                                  dateTimeFormat(
                                      'yMMMd',
                                      commissionDetailsCommissionsRecord
                                          .commissionCreated),
                                  style: FlutterFlowTheme.subtitle2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  dateTimeFormat(
                                      'jms',
                                      commissionDetailsCommissionsRecord
                                          .commissionCreated),
                                  style: FlutterFlowTheme.subtitle2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.indirectCommission ?? true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: AutoSizeText(
                                        'Commission Type',
                                        style: FlutterFlowTheme.subtitle2,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: AutoSizeText(
                                        commissionDetailsCommissionsRecord
                                            .commissionType,
                                        style: FlutterFlowTheme.subtitle2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
