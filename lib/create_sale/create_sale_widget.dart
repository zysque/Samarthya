import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateSaleWidget extends StatefulWidget {
  const CreateSaleWidget({Key key}) : super(key: key);

  @override
  _CreateSaleWidgetState createState() => _CreateSaleWidgetState();
}

class _CreateSaleWidgetState extends State<CreateSaleWidget>
    with TickerProviderStateMixin {
  String projectValue;
  TextEditingController textController1;
  TextEditingController descriptionController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
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
    textController1 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Log Sale',
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 100,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Amount',
                              hintStyle: FlutterFlowTheme.title1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayLight,
                                fontWeight: FontWeight.w300,
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
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 24, 24, 24),
                              prefixIcon: FaIcon(
                                FontAwesomeIcons.rupeeSign,
                                color: FlutterFlowTheme.textColor,
                                size: 32,
                              ),
                            ),
                            style: FlutterFlowTheme.title1,
                            textAlign: TextAlign.center,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter an amount';
                              }

                              return null;
                            },
                          ).animated(
                              [animationsMap['textFieldOnPageLoadAnimation']]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: StreamBuilder<List<ProjectsRecord>>(
                          stream: queryProjectsRecord(),
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
                            List<ProjectsRecord> projectProjectsRecordList =
                                snapshot.data;
                            return FlutterFlowDropDown(
                              options: projectProjectsRecordList
                                  .map((e) => e.projectName)
                                  .toList()
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => projectValue = val),
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              textStyle: FlutterFlowTheme.title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayLight,
                              ),
                              hintText: 'Please select Project',
                              fillColor: FlutterFlowTheme.darkBackground,
                              elevation: 2,
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              borderRadius: 0,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: descriptionController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Sale Description',
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
                          maxLines: 12,
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
                      List<AdminConstsRecord> rowAdminConstsRecordList =
                          snapshot.data;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data.isEmpty) {
                        return Container();
                      }
                      final rowAdminConstsRecord =
                          rowAdminConstsRecordList.isNotEmpty
                              ? rowAdminConstsRecordList.first
                              : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<List<CalculationListRecord>>(
                            stream: queryCalculationListRecord(
                              queryBuilder: (calculationListRecord) =>
                                  calculationListRecord.where('userRef',
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
                              List<CalculationListRecord>
                                  buttonCalculationListRecordList =
                                  snapshot.data;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data.isEmpty) {
                                return Container();
                              }
                              final buttonCalculationListRecord =
                                  buttonCalculationListRecordList.isNotEmpty
                                      ? buttonCalculationListRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  if (!formKey.currentState.validate()) {
                                    return;
                                  }
                                  final salesCreateData = createSalesRecordData(
                                    saleAmount: int.parse(textController1.text),
                                    projectName: projectValue,
                                    saleDesc: descriptionController.text,
                                    saleCreated: getCurrentTimestamp,
                                    saleUser: currentUserReference,
                                    processed: false,
                                  );
                                  await SalesRecord.collection
                                      .doc()
                                      .set(salesCreateData);

                                  final calculationListUpdateData =
                                      createCalculationListRecordData(
                                    unProcessedAmount: functions.getSum(
                                        buttonCalculationListRecord
                                            .unProcessedAmount,
                                        int.parse(textController1.text)),
                                  );
                                  await buttonCalculationListRecord.reference
                                      .update(calculationListUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NavBarPage(initialPage: 'MySales'),
                                    ),
                                  );
                                },
                                text: 'Log Sale',
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
              'Tap above to complete request',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0x43000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
