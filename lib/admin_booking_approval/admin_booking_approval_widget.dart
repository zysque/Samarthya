import '../admin_approvals/admin_approvals_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/calculate_e_m_i_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminBookingApprovalWidget extends StatefulWidget {
  const AdminBookingApprovalWidget({
    Key key,
    this.bookingRef,
  }) : super(key: key);

  final DocumentReference bookingRef;

  @override
  _AdminBookingApprovalWidgetState createState() =>
      _AdminBookingApprovalWidgetState();
}

class _AdminBookingApprovalWidgetState
    extends State<AdminBookingApprovalWidget> {
  String emiTenureValue;
  TextEditingController areaController;
  TextEditingController plotController;
  TextEditingController rateController;
  TextEditingController bookingAmtController;
  TextEditingController downPaymentController;
  TextEditingController descriptionController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AdminConstsRecord>>(
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
        List<AdminConstsRecord> adminBookingApprovalAdminConstsRecordList =
            snapshot.data;
        final adminBookingApprovalAdminConstsRecord =
            adminBookingApprovalAdminConstsRecordList.isNotEmpty
                ? adminBookingApprovalAdminConstsRecordList.first
                : null;
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
              'Approve Bookings',
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
            child: StreamBuilder<BookingsRecord>(
              stream: BookingsRecord.getDocument(widget.bookingRef),
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
                final columnBookingsRecord = snapshot.data;
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: StreamBuilder<ProjectsRecord>(
                                  stream: ProjectsRecord.getDocument(
                                      columnBookingsRecord.projectRef),
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
                                    final projectProjectsRecord = snapshot.data;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          projectProjectsRecord.projectName,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        Text(
                                          projectProjectsRecord.projectCity,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 0),
                                child: StreamBuilder<PlansAndRatesRecord>(
                                  stream: PlansAndRatesRecord.getDocument(
                                      columnBookingsRecord.planRef),
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
                                    final planPlansAndRatesRecord =
                                        snapshot.data;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          planPlansAndRatesRecord.phaseCode,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        Text(
                                          formatNumber(
                                            planPlansAndRatesRecord
                                                .fixedRatePerSqFt,
                                            formatType: FormatType.custom,
                                            currency: '',
                                            format: '',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        Text(
                                          formatNumber(
                                            planPlansAndRatesRecord
                                                .minBookingAmtPerc,
                                            formatType: FormatType.percent,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              StreamBuilder<PlansAndRatesRecord>(
                                stream: PlansAndRatesRecord.getDocument(
                                    columnBookingsRecord.planRef),
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
                                  final bookingDetailsPlansAndRatesRecord =
                                      snapshot.data;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: TextFormField(
                                          controller: plotController ??=
                                              TextEditingController(
                                            text: columnBookingsRecord.plotNo,
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Plot No',
                                            hintText:
                                                'Please enter plot number',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 4, 20, 4),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: TextFormField(
                                          controller: areaController ??=
                                              TextEditingController(
                                            text: columnBookingsRecord
                                                .areaBookedInSqft
                                                .toString(),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Plot Area',
                                            hintText:
                                                'Please enter plot area in sqft',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 4, 20, 4),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: TextFormField(
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'rateController',
                                            Duration(milliseconds: 200),
                                            () => setState(() {}),
                                          ),
                                          controller: rateController ??=
                                              TextEditingController(
                                            text:
                                                bookingDetailsPlansAndRatesRecord
                                                    .fixedRatePerSqFt
                                                    .toString(),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Rate Per SqFt',
                                            hintText:
                                                'Please enter rate per sqft',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 4, 20, 4),
                                            prefixIcon: FaIcon(
                                              FontAwesomeIcons.rupeeSign,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayLight,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: TextFormField(
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'bookingAmtController',
                                            Duration(milliseconds: 200),
                                            () => setState(() {}),
                                          ),
                                          controller: bookingAmtController ??=
                                              TextEditingController(
                                            text: columnBookingsRecord
                                                .bookingAmount
                                                .toString(),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Booking Amount',
                                            hintText:
                                                'Please enter booking amount',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 4, 20, 4),
                                            prefixIcon: FaIcon(
                                              FontAwesomeIcons.rupeeSign,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayLight,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: TextFormField(
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'downPaymentController',
                                            Duration(milliseconds: 200),
                                            () => setState(() {}),
                                          ),
                                          controller: downPaymentController ??=
                                              TextEditingController(
                                            text: columnBookingsRecord
                                                .downPayment
                                                .toString(),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Down Payment',
                                            hintText:
                                                'Please enter booking amount',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 4, 20, 4),
                                            prefixIcon: FaIcon(
                                              FontAwesomeIcons.rupeeSign,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayLight,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FlutterFlowDropDown(
                                              initialOption: emiTenureValue ??=
                                                  '${columnBookingsRecord.emiTenureInMonths.toString()} Months',
                                              options:
                                                  bookingDetailsPlansAndRatesRecord
                                                      .emiTenureOptions
                                                      .toList()
                                                      .toList(),
                                              onChanged: (val) => setState(
                                                  () => emiTenureValue = val),
                                              width: 200,
                                              height: 50,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                              hintText: 'Select EMI Tenure',
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .darkBackground,
                                              elevation: 2,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .grayDark,
                                              borderWidth: 0,
                                              borderRadius: 8,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 4, 4),
                                              hidesUnderline: true,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 40, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child:
                                                            CalculateEMIWidget(
                                                          planRef:
                                                              bookingDetailsPlansAndRatesRecord
                                                                  .reference,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: FaIcon(
                                                  FontAwesomeIcons.calculator,
                                                  color: Color(0xFF7CD514),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Monthly Installments',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 0),
                                              child: FaIcon(
                                                FontAwesomeIcons.rupeeSign,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight,
                                                size: 18,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions
                                                      .emiCalculator(
                                                          int.parse(
                                                              areaController
                                                                      ?.text ??
                                                                  ''),
                                                          int.parse(
                                                              rateController
                                                                      ?.text ??
                                                                  ''),
                                                          double.parse(
                                                              bookingAmtController
                                                                      ?.text ??
                                                                  ''),
                                                          double.parse(
                                                              downPaymentController
                                                                      ?.text ??
                                                                  ''),
                                                          emiTenureValue)
                                                      .toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: TextFormField(
                                          controller: descriptionController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            hintText: 'Booking  Description',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayDark,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .darkBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 4, 24, 4),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                fontSize: 13,
                                              ),
                                          textAlign: TextAlign.start,
                                          maxLines: 8,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: StreamBuilder<List<UserHierarchiesRecord>>(
                        stream: queryUserHierarchiesRecord(
                          queryBuilder: (userHierarchiesRecord) =>
                              userHierarchiesRecord.where('hierarchyUser',
                                  isEqualTo: columnBookingsRecord.buyerRef),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 40,
                                ),
                              ),
                            );
                          }
                          List<UserHierarchiesRecord>
                              actionsUserHierarchiesRecordList = snapshot.data;
                          final actionsUserHierarchiesRecord =
                              actionsUserHierarchiesRecordList.isNotEmpty
                                  ? actionsUserHierarchiesRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<CalculationsRecord>>(
                                stream: queryCalculationsRecord(
                                  queryBuilder: (calculationsRecord) =>
                                      calculationsRecord.where('userRef',
                                          isEqualTo:
                                              columnBookingsRecord.buyerRef),
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
                                  List<CalculationsRecord>
                                      logBookingCalculationsRecordList =
                                      snapshot.data;
                                  final logBookingCalculationsRecord =
                                      logBookingCalculationsRecordList
                                              .isNotEmpty
                                          ? logBookingCalculationsRecordList
                                              .first
                                          : null;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      final bookingsUpdateData = {
                                        ...createBookingsRecordData(
                                          totalAmountToPay:
                                              functions.getMultiplication(
                                                  double.parse(
                                                      rateController?.text ??
                                                          ''),
                                                  double.parse(
                                                      areaController?.text ??
                                                          '')),
                                          areaBookedInSqft: int.parse(
                                              areaController?.text ?? ''),
                                          bookingAmount: double.parse(
                                              bookingAmtController?.text ?? ''),
                                          downPayment: double.parse(
                                              downPaymentController?.text ??
                                                  ''),
                                          emiAmount: functions.emiCalculator(
                                              int.parse(
                                                  areaController?.text ?? ''),
                                              int.parse(
                                                  rateController?.text ?? ''),
                                              double.parse(
                                                  bookingAmtController?.text ??
                                                      ''),
                                              double.parse(
                                                  downPaymentController?.text ??
                                                      ''),
                                              emiTenureValue),
                                          emiTenureInMonths:
                                              functions.parseReplaceFromString(
                                                  emiTenureValue, ' Months'),
                                          isApproved: true,
                                          dueAmount: functions.getSum(
                                              double.parse(
                                                  bookingAmtController?.text ??
                                                      ''),
                                              double.parse(
                                                  downPaymentController?.text ??
                                                      '')),
                                          dueDate: functions.getNewDate(
                                              getCurrentTimestamp,
                                              0,
                                              1,
                                              adminBookingApprovalAdminConstsRecord
                                                  .emiPaymentDay,
                                              true,
                                              getCurrentTimestamp),
                                          lastModified: getCurrentTimestamp,
                                          amountLeftToPay:
                                              functions.getMultiplication(
                                                  double.parse(
                                                      rateController?.text ??
                                                          ''),
                                                  double.parse(
                                                      areaController?.text ??
                                                          '')),
                                          plotNo: plotController?.text ?? '',
                                        ),
                                        'comments': FieldValue.arrayUnion(
                                            [descriptionController.text]),
                                      };
                                      await widget.bookingRef
                                          .update(bookingsUpdateData);

                                      final calculationsUpdateData =
                                          createCalculationsRecordData(
                                        emiDueAmount: functions.getSum(
                                            logBookingCalculationsRecord
                                                .emiDueAmount,
                                            functions.getSum(
                                                double.parse(
                                                    bookingAmtController
                                                            ?.text ??
                                                        ''),
                                                double.parse(
                                                    downPaymentController
                                                            ?.text ??
                                                        ''))),
                                        emiDueDate: functions.getNewDate(
                                            getCurrentTimestamp,
                                            0,
                                            1,
                                            adminBookingApprovalAdminConstsRecord
                                                .emiPaymentDay,
                                            (logBookingCalculationsRecord
                                                    .emiDueAmount) <=
                                                0.0,
                                            logBookingCalculationsRecord
                                                .emiDueDate),
                                      );
                                      await logBookingCalculationsRecord
                                          .reference
                                          .update(calculationsUpdateData);
                                      if (actionsUserHierarchiesRecord
                                          .hasReferral) {
                                        final commissionsCreateData = {
                                          ...createCommissionsRecordData(
                                            commissionUser:
                                                actionsUserHierarchiesRecord
                                                    .referralParent,
                                            isDirect: true,
                                            bookingRef: widget.bookingRef,
                                            commissionAmount: 0.0,
                                            unsettledAmount: 0.0,
                                            lastModified: getCurrentTimestamp,
                                          ),
                                          'comments': [
                                            'Commission record created for new business booking recieved.'
                                          ],
                                        };
                                        await CommissionsRecord.collection
                                            .doc()
                                            .set(commissionsCreateData);
                                      }
                                      final plansAndRatesUpdateData = {
                                        ...createPlansAndRatesRecordData(
                                          lastModified: getCurrentTimestamp,
                                        ),
                                        'plotsAvailable':
                                            FieldValue.arrayRemove(
                                                [plotController?.text ?? '']),
                                      };
                                      await columnBookingsRecord.planRef
                                          .update(plansAndRatesUpdateData);
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AdminApprovalsWidget(),
                                        ),
                                        (r) => false,
                                      );
                                    },
                                    text: 'Approve',
                                    options: FFButtonOptions(
                                      width: 180,
                                      height: 50,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      textStyle:
                                          FlutterFlowTheme.of(context).title1,
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .darkBackground,
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
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
