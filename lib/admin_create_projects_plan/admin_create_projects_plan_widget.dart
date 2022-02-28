import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCreateProjectsPlanWidget extends StatefulWidget {
  const AdminCreateProjectsPlanWidget({
    Key key,
    this.projectRef,
  }) : super(key: key);

  final DocumentReference projectRef;

  @override
  _AdminCreateProjectsPlanWidgetState createState() =>
      _AdminCreateProjectsPlanWidgetState();
}

class _AdminCreateProjectsPlanWidgetState
    extends State<AdminCreateProjectsPlanWidget> with TickerProviderStateMixin {
  TextEditingController fixRateController;
  TextEditingController phaseCodeController;
  double downPaymentPercentageValue;
  TextEditingController plotEndController;
  TextEditingController plotStartController;
  TextEditingController paymentsDaysController;
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
    'textFieldOnPageLoadAnimation3': AnimationInfo(
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

    fixRateController = TextEditingController();
    phaseCodeController = TextEditingController();
    plotEndController = TextEditingController();
    plotStartController = TextEditingController();
    paymentsDaysController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Create Project Plan',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).textColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
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
                height: 620,
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        controller: phaseCodeController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Phase Code',
                          labelStyle: FlutterFlowTheme.of(context)
                              .title1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                          hintText: 'Phase Code',
                          hintStyle: FlutterFlowTheme.of(context)
                              .title1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).grayDark,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).grayDark,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                        ),
                        style: FlutterFlowTheme.of(context).subtitle2,
                        textAlign: TextAlign.center,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Field is required';
                          }
                          if (val.length < 1) {
                            return 'Requires at least 1 characters.';
                          }
                          return null;
                        },
                      ).animated(
                          [animationsMap['textFieldOnPageLoadAnimation1']]),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: fixRateController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Fix Rate per SqFt',
                            labelStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                            hintText: 'Fix Rate per SqFt',
                            hintStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayDark,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayDark,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                            prefixIcon: FaIcon(
                              FontAwesomeIcons.rupeeSign,
                              color: FlutterFlowTheme.of(context).textColor,
                              size: 32,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).subtitle2,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Field is required';
                            }
                            if (val.length < 1) {
                              return 'Requires at least 1 characters.';
                            }
                            return null;
                          },
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation2']]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'Minimum Booking Amount Percentages',
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      Slider(
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        inactiveColor: Color(0xFF9E9E9E),
                        min: 0,
                        max: 1,
                        value: downPaymentPercentageValue ??= 0.01,
                        label: downPaymentPercentageValue.toString(),
                        divisions: 100,
                        onChanged: (newValue) {
                          setState(() => downPaymentPercentageValue = newValue);
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Plots Range',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
                                ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: TextFormField(
                                controller: plotStartController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Start',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  hintText: 'Enter starting plot No',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 20, 10),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Field is required';
                                  }
                                  if (val.length < 1) {
                                    return 'Requires at least 1 characters.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: TextFormField(
                                controller: plotEndController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'End',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  hintText: 'Enter ending plot No',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 20, 10),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Field is required';
                                  }
                                  if (val.length < 1) {
                                    return 'Requires at least 1 characters.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: paymentsDaysController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Max Days Allowed',
                            labelStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                            hintText: 'Max Days allowed for booking payment',
                            hintStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayDark,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayDark,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                          ),
                          style: FlutterFlowTheme.of(context).subtitle2,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation3']]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'Select EMI Options (Slide Left)',
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Slidable(
                                actionPane: const SlidableScrollActionPane(),
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                actionPane: const SlidableScrollActionPane(),
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                actionPane: const SlidableScrollActionPane(),
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                actionPane: const SlidableScrollActionPane(),
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                actionPane: const SlidableScrollActionPane(),
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                actionPane: const SlidableScrollActionPane(),
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                actionPane: const SlidableScrollActionPane(),
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
                                actionPane: const SlidableScrollActionPane(),
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      final plansAndRatesCreateData = {
                        ...createPlansAndRatesRecordData(
                          phaseCode: phaseCodeController.text,
                          fixedRatePerSqFt: int.parse(fixRateController.text),
                          minBookingAmtPerc: downPaymentPercentageValue,
                          projectRef: widget.projectRef,
                          created: getCurrentTimestamp,
                          lastModified: getCurrentTimestamp,
                          paymentDaysAllowed:
                              int.parse(paymentsDaysController.text),
                        ),
                        'emiTenureOptions': FFAppState().strList,
                        'plotsAvailable': functions.getNumbersInBetween(
                            int.parse(plotStartController.text),
                            int.parse(plotEndController.text)),
                      };
                      await PlansAndRatesRecord.collection
                          .doc()
                          .set(plansAndRatesCreateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'projects'),
                        ),
                      );
                    },
                    text: 'Create',
                    options: FFButtonOptions(
                      width: 200,
                      height: 60,
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      textStyle: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Lexend Deca',
                            fontSize: 24,
                          ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).darkBackground,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
