import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminModifyProjectsPlanWidget extends StatefulWidget {
  const AdminModifyProjectsPlanWidget({
    Key key,
    this.planRef,
  }) : super(key: key);

  final DocumentReference planRef;

  @override
  _AdminModifyProjectsPlanWidgetState createState() =>
      _AdminModifyProjectsPlanWidgetState();
}

class _AdminModifyProjectsPlanWidgetState
    extends State<AdminModifyProjectsPlanWidget> with TickerProviderStateMixin {
  TextEditingController fixRateController;
  TextEditingController phaseCodeController;
  double downPaymentPercentageValue;
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
      child: Scaffold(
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
              color: FlutterFlowTheme.grayLight,
              size: 32,
            ),
          ),
          title: Text(
            'Modify Project Plan',
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
        body: StreamBuilder<PlansAndRatesRecord>(
          stream: PlansAndRatesRecord.getDocument(widget.planRef),
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
            final columnPlansAndRatesRecord = snapshot.data;
            return Column(
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
                    height: 600,
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
                          TextFormField(
                            controller: phaseCodeController ??=
                                TextEditingController(
                              text: columnPlansAndRatesRecord.phaseCode,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Phase Code',
                              labelStyle: FlutterFlowTheme.title1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayLight,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              hintText: 'Phase Code',
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
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                            ),
                            style: FlutterFlowTheme.subtitle2,
                            textAlign: TextAlign.center,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter an amount';
                              }

                              return null;
                            },
                          ).animated(
                              [animationsMap['textFieldOnPageLoadAnimation1']]),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: TextFormField(
                              controller: fixRateController ??=
                                  TextEditingController(
                                text: columnPlansAndRatesRecord.fixedRatePerSqFt
                                    .toString(),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Fix Rate per SqFt',
                                labelStyle: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.grayLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                                hintText: 'Fix Rate per SqFt',
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
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                                prefixIcon: FaIcon(
                                  FontAwesomeIcons.rupeeSign,
                                  color: FlutterFlowTheme.textColor,
                                  size: 32,
                                ),
                              ),
                              style: FlutterFlowTheme.subtitle2,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please enter City';
                                }

                                return null;
                              },
                            ).animated([
                              animationsMap['textFieldOnPageLoadAnimation2']
                            ]),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Text(
                              'Minimum Booking Amount Percentages',
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Slider(
                              activeColor: FlutterFlowTheme.primaryColor,
                              inactiveColor: Color(0xFF9E9E9E),
                              min: 0,
                              max: 1,
                              value: downPaymentPercentageValue ??=
                                  columnPlansAndRatesRecord.minBookingAmtPerc,
                              label: downPaymentPercentageValue.toString(),
                              onChanged: (newValue) {
                                setState(() =>
                                    downPaymentPercentageValue = newValue);
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Text(
                              'Select EMI Options (Slide Left)',
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Add',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .add('12 Months'));
                                        },
                                      ),
                                      IconSlideAction(
                                        caption: 'Remove',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .remove('12 Months'));
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '12 Months',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 14,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                  Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Add',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .add('24 Months'));
                                        },
                                      ),
                                      IconSlideAction(
                                        caption: 'Remove',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .remove('24 Months'));
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '24 Months',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 14,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                  Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Add',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .add('30 Months'));
                                        },
                                      ),
                                      IconSlideAction(
                                        caption: 'Remove',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .remove('30 Months'));
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '30 Months',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 14,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                  Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Add',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .add('36 Months'));
                                        },
                                      ),
                                      IconSlideAction(
                                        caption: 'Remove',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .remove('36 Months'));
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '36 Months',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 14,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                  Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Add',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .add('42 Months'));
                                        },
                                      ),
                                      IconSlideAction(
                                        caption: 'Remove',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .remove('42 Months'));
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '42 Months',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 14,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                  Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Add',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .add('48 Months'));
                                        },
                                      ),
                                      IconSlideAction(
                                        caption: 'Remove',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .remove('48 Months'));
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '48 Months',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 14,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                  Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Add',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .add('54 Months'));
                                        },
                                      ),
                                      IconSlideAction(
                                        caption: 'Remove',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .remove('54 Months'));
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '54 Months',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 14,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                  Slidable(
                                    actionPane:
                                        const SlidableScrollActionPane(),
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: 'Add',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .add('60 Months'));
                                        },
                                      ),
                                      IconSlideAction(
                                        caption: 'Remove',
                                        color: Colors.blue,
                                        icon: Icons.share,
                                        onTap: () async {
                                          setState(() => FFAppState()
                                              .strList
                                              .remove('60 Months'));
                                        },
                                      ),
                                    ],
                                    child: ListTile(
                                      title: Text(
                                        '60 Months',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 14,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                          final plansAndRatesUpdateData = {
                            ...createPlansAndRatesRecordData(
                              phaseCode: phaseCodeController?.text ?? '',
                              fixedRatePerSqFt:
                                  int.parse(fixRateController?.text ?? ''),
                              minBookingAmtPerc: downPaymentPercentageValue,
                              lastModified: getCurrentTimestamp,
                            ),
                            'emiTenureOptions': FFAppState().strList,
                          };
                          await widget.planRef.update(plansAndRatesUpdateData);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'projects'),
                            ),
                          );
                        },
                        text: 'Modify',
                        options: FFButtonOptions(
                          width: 200,
                          height: 60,
                          color: FlutterFlowTheme.tertiaryColor,
                          textStyle: FlutterFlowTheme.title1.override(
                            fontFamily: 'Lexend Deca',
                            fontSize: 24,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.darkBackground,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
