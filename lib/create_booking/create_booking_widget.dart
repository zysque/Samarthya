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
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBookingWidget extends StatefulWidget {
  const CreateBookingWidget({
    Key key,
    this.projectRef,
  }) : super(key: key);

  final DocumentReference projectRef;

  @override
  _CreateBookingWidgetState createState() => _CreateBookingWidgetState();
}

class _CreateBookingWidgetState extends State<CreateBookingWidget> {
  String emiTenureValue;
  TextEditingController areaController;
  TextEditingController downPaymentController;
  TextEditingController descriptionController;
  TextEditingController bookingAmtController;
  TextEditingController totalAmountController;
  TextEditingController leftAmountController;
  TextEditingController emiPayController;
  String phaseValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    areaController = TextEditingController();
    downPaymentController = TextEditingController();
    descriptionController = TextEditingController();
    bookingAmtController = TextEditingController(
        text: functions
            .getMultiplication(
                functions.getMultiplication(
                    bookingDetailsPlansAndRatesRecord.fixedRatePerSqFt
                        .toDouble(),
                    bookingDetailsPlansAndRatesRecord.minBookingAmtPerc),
                functions.getMultiplication(
                    double.parse(areaController.text), 0.01))
            .toString()
            .toString());
    leftAmountController = TextEditingController(
        text: functions
            .getDiffD(
                functions.getMultiplication(
                    double.parse(areaController.text),
                    bookingDetailsPlansAndRatesRecord.fixedRatePerSqFt
                        .toDouble()),
                double.parse(downPaymentController.text))
            .toString()
            .toString());
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
            'Make Booking',
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
                height: MediaQuery.of(context).size.height * 0.73,
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<PlansAndRatesRecord>>(
                        stream: queryPlansAndRatesRecord(
                          queryBuilder: (plansAndRatesRecord) =>
                              plansAndRatesRecord.where('projectRef',
                                  isEqualTo: widget.projectRef),
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
                          List<PlansAndRatesRecord>
                              phasePlansAndRatesRecordList = snapshot.data;
                          return FlutterFlowDropDown(
                            options: phasePlansAndRatesRecordList
                                .map((e) => e.phaseCode)
                                .toList()
                                .toList(),
                            onChanged: (val) =>
                                setState(() => phaseValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            textStyle: FlutterFlowTheme.subtitle1,
                            hintText: 'Please select Plan Phase',
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
                      StreamBuilder<List<PlansAndRatesRecord>>(
                        stream: queryPlansAndRatesRecord(
                          queryBuilder: (plansAndRatesRecord) =>
                              plansAndRatesRecord.where('phaseCode',
                                  isEqualTo: phaseValue),
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
                          List<PlansAndRatesRecord>
                              bookingDetailsPlansAndRatesRecordList =
                              snapshot.data;
                          final bookingDetailsPlansAndRatesRecord =
                              bookingDetailsPlansAndRatesRecordList.isNotEmpty
                                  ? bookingDetailsPlansAndRatesRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: TextFormField(
                                  controller: areaController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Plot Area',
                                    labelStyle: FlutterFlowTheme.subtitle1,
                                    hintText: 'Please enter plot area in sqft',
                                    hintStyle: FlutterFlowTheme.subtitle1,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 4, 20, 4),
                                  ),
                                  style: FlutterFlowTheme.subtitle1,
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Field is required';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rate per SQFT',
                                      style: FlutterFlowTheme.subtitle1,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: FaIcon(
                                        FontAwesomeIcons.rupeeSign,
                                        color: FlutterFlowTheme.grayLight,
                                        size: 18,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        bookingDetailsPlansAndRatesRecord
                                            .fixedRatePerSqFt
                                            .toString(),
                                        style: FlutterFlowTheme.subtitle1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Booking Amount',
                                      style: FlutterFlowTheme.subtitle1,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: FaIcon(
                                        FontAwesomeIcons.rupeeSign,
                                        color: FlutterFlowTheme.grayLight,
                                        size: 18,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        bookingAmtController.text,
                                        style: FlutterFlowTheme.subtitle1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: TextFormField(
                                  controller: downPaymentController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Down Payment',
                                    labelStyle: FlutterFlowTheme.subtitle1,
                                    hintText: 'Please enter booking amount',
                                    hintStyle: FlutterFlowTheme.subtitle1,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                  ),
                                  style: FlutterFlowTheme.subtitle1,
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Field is required';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowDropDown(
                                      options: bookingDetailsPlansAndRatesRecord
                                          .emiTenureOptions
                                          .toList()
                                          .toList(),
                                      onChanged: (val) =>
                                          setState(() => emiTenureValue = val),
                                      width: 200,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.subtitle1,
                                      hintText: 'Select EMI Tenure',
                                      fillColor:
                                          FlutterFlowTheme.darkBackground,
                                      elevation: 2,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 4, 4),
                                      hidesUnderline: true,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 40, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: CalculateEMIWidget(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Monthly Installments',
                                      style: FlutterFlowTheme.subtitle1,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: FaIcon(
                                        FontAwesomeIcons.rupeeSign,
                                        color: FlutterFlowTheme.grayLight,
                                        size: 18,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        emiPayController?.text ?? '',
                                        style: FlutterFlowTheme.subtitle1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: descriptionController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Booking  Description',
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
                                            20, 10, 24, 0),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.textColor,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 12,
                                ),
                              ),
                              if (('a') == 'b')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: bookingAmtController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 2,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: totalAmountController ??=
                                            TextEditingController(
                                          text: functions
                                              .getMultiplication(
                                                  bookingDetailsPlansAndRatesRecord
                                                      .fixedRatePerSqFt
                                                      .toDouble(),
                                                  double.parse(
                                                      areaController.text))
                                              .toString(),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 2,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: leftAmountController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 2,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: emiPayController ??=
                                            TextEditingController(
                                          text: functions
                                              .emiCalculator(
                                                  int.parse(
                                                      areaController.text),
                                                  bookingDetailsPlansAndRatesRecord
                                                      .fixedRatePerSqFt,
                                                  double.parse(
                                                      bookingAmtController
                                                          .text),
                                                  double.parse(
                                                      downPaymentController
                                                          .text),
                                                  emiTenureValue)
                                              .toString(),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 2,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                  ],
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<PlansAndRatesRecord>>(
                    stream: queryPlansAndRatesRecord(
                      queryBuilder: (plansAndRatesRecord) => plansAndRatesRecord
                          .where('phaseCode', isEqualTo: phaseValue),
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
                      List<PlansAndRatesRecord>
                          logBookingPlansAndRatesRecordList = snapshot.data;
                      final logBookingPlansAndRatesRecord =
                          logBookingPlansAndRatesRecordList.isNotEmpty
                              ? logBookingPlansAndRatesRecordList.first
                              : null;
                      return FFButtonWidget(
                        onPressed: () async {
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                          final bookingsCreateData = createBookingsRecordData(
                            projectRef: widget.projectRef,
                            planRef: logBookingPlansAndRatesRecord.reference,
                            buyerRef: currentUserReference,
                            totalAmountToPay:
                                double.parse(totalAmountController?.text ?? ''),
                            areaBookedInSqft: int.parse(areaController.text),
                            bookingAmount:
                                double.parse(bookingAmtController.text),
                            downPayment:
                                double.parse(downPaymentController.text),
                            emiAmount:
                                double.parse(emiPayController?.text ?? ''),
                            emiTenureInMonths: functions.parseReplaceFromString(
                                emiTenureValue, ' Months'),
                            created: getCurrentTimestamp,
                            isApproved: false,
                            amountLeftToPay:
                                double.parse(leftAmountController.text),
                            lastModified: getCurrentTimestamp,
                          );
                          await BookingsRecord.collection
                              .doc()
                              .set(bookingsCreateData);
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'projects'),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Book',
                        options: FFButtonOptions(
                          width: 180,
                          height: 50,
                          color: FlutterFlowTheme.tertiaryColor,
                          textStyle: FlutterFlowTheme.title1,
                          elevation: 0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.darkBackground,
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
          ],
        ),
      ),
    );
  }
}
