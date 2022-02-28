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

class CreateBookingWidget extends StatefulWidget {
  const CreateBookingWidget({
    Key key,
    this.planRef,
  }) : super(key: key);

  final DocumentReference planRef;

  @override
  _CreateBookingWidgetState createState() => _CreateBookingWidgetState();
}

class _CreateBookingWidgetState extends State<CreateBookingWidget> {
  String emiTenureValue;
  TextEditingController descriptionController;
  String plotValue;
  TextEditingController areaController;
  TextEditingController downPaymentController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    areaController = TextEditingController(text: '0');
    downPaymentController = TextEditingController(text: '0');
    descriptionController = TextEditingController();
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
          'Make Booking',
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: StreamBuilder<PlansAndRatesRecord>(
                          stream:
                              PlansAndRatesRecord.getDocument(widget.planRef),
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
                            final plotPlansAndRatesRecord = snapshot.data;
                            return FlutterFlowDropDown(
                              options: plotPlansAndRatesRecord.plotsAvailable
                                  .toList()
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => plotValue = val),
                              height: 45,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                  ),
                              hintText: 'Select Plot',
                              fillColor:
                                  FlutterFlowTheme.of(context).darkBackground,
                              elevation: 2,
                              borderColor:
                                  FlutterFlowTheme.of(context).grayDark,
                              borderWidth: 2,
                              borderRadius: 8,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                              hidesUnderline: true,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'areaController',
                            Duration(milliseconds: 200),
                            () => setState(() {}),
                          ),
                          controller: areaController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Plot Area',
                            labelStyle:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF98FFFF),
                                    ),
                            hintText: 'Please enter plot area in sqft',
                            hintStyle: FlutterFlowTheme.of(context).subtitle1,
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
                                EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).textColor,
                              ),
                          textAlign: TextAlign.start,
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'downPaymentController',
                            Duration(milliseconds: 200),
                            () => setState(() {}),
                          ),
                          controller: downPaymentController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Down Payment',
                            labelStyle:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF98FFFF),
                                    ),
                            hintText: 'Please enter booking amount',
                            hintStyle: FlutterFlowTheme.of(context).subtitle1,
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
                                EdgeInsetsDirectional.fromSTEB(20, 4, 20, 4),
                            prefixIcon: FaIcon(
                              FontAwesomeIcons.rupeeSign,
                              color: FlutterFlowTheme.of(context).textColor,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).textColor,
                              ),
                          textAlign: TextAlign.start,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: StreamBuilder<PlansAndRatesRecord>(
                          stream:
                              PlansAndRatesRecord.getDocument(widget.planRef),
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rate per SQFT',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: FaIcon(
                                        FontAwesomeIcons.rupeeSign,
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                        size: 18,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          bookingDetailsPlansAndRatesRecord
                                              .fixedRatePerSqFt
                                              .toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Amount',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: FaIcon(
                                          FontAwesomeIcons.rupeeSign,
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                          size: 18,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions
                                                .getMultiplication(
                                                    double.parse(
                                                        areaController.text),
                                                    bookingDetailsPlansAndRatesRecord
                                                        .fixedRatePerSqFt
                                                        .toDouble())
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Booking Amount',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: FaIcon(
                                          FontAwesomeIcons.rupeeSign,
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                          size: 18,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions
                                                .getBookingAmt(
                                                    bookingDetailsPlansAndRatesRecord
                                                        .minBookingAmtPerc,
                                                    bookingDetailsPlansAndRatesRecord
                                                        .fixedRatePerSqFt
                                                        .toDouble(),
                                                    int.parse(
                                                        areaController.text))
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowDropDown(
                                        initialOption: emiTenureValue ??=
                                            '12 Months',
                                        options:
                                            bookingDetailsPlansAndRatesRecord
                                                .emiTenureOptions
                                                .toList()
                                                .toList(),
                                        onChanged: (val) => setState(
                                            () => emiTenureValue = val),
                                        width: 200,
                                        height: 50,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                            ),
                                        hintText: 'Select EMI Tenure',
                                        fillColor: FlutterFlowTheme.of(context)
                                            .darkBackground,
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Monthly Installments',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: FaIcon(
                                          FontAwesomeIcons.rupeeSign,
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                          size: 18,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions
                                                .emiCalculator(
                                                    int.parse(
                                                        areaController.text),
                                                    bookingDetailsPlansAndRatesRecord
                                                        .fixedRatePerSqFt,
                                                    functions.getBookingAmt(
                                                        bookingDetailsPlansAndRatesRecord
                                                            .minBookingAmtPerc,
                                                        bookingDetailsPlansAndRatesRecord
                                                            .fixedRatePerSqFt
                                                            .toDouble(),
                                                        int.parse(areaController
                                                            .text)),
                                                    double.parse(
                                                        downPaymentController
                                                            .text),
                                                    emiTenureValue)
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 20),
                                  child: TextFormField(
                                    controller: descriptionController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Description',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF98FFFF),
                                          ),
                                      hintText: 'Booking  Description',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .grayDark,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .grayDark,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 20, 24, 0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
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
                  queryBuilder: (userHierarchiesRecord) => userHierarchiesRecord
                      .where('hierarchyUser', isEqualTo: currentUserReference),
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
                  List<UserHierarchiesRecord> actionsUserHierarchiesRecordList =
                      snapshot.data;
                  final actionsUserHierarchiesRecord =
                      actionsUserHierarchiesRecordList.isNotEmpty
                          ? actionsUserHierarchiesRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<PlansAndRatesRecord>(
                        stream: PlansAndRatesRecord.getDocument(widget.planRef),
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
                          final logBookingPlansAndRatesRecord = snapshot.data;
                          return FFButtonWidget(
                            onPressed: () async {
                              final bookingsCreateData = {
                                ...createBookingsRecordData(
                                  projectRef:
                                      logBookingPlansAndRatesRecord.projectRef,
                                  planRef: widget.planRef,
                                  buyerRef: currentUserReference,
                                  totalAmountToPay: functions.getMultiplication(
                                      logBookingPlansAndRatesRecord
                                          .fixedRatePerSqFt
                                          .toDouble(),
                                      double.parse(areaController.text)),
                                  areaBookedInSqft:
                                      int.parse(areaController.text),
                                  bookingAmount: functions.getBookingAmt(
                                      logBookingPlansAndRatesRecord
                                          .minBookingAmtPerc,
                                      logBookingPlansAndRatesRecord
                                          .fixedRatePerSqFt
                                          .toDouble(),
                                      int.parse(areaController.text)),
                                  downPayment:
                                      double.parse(downPaymentController.text),
                                  emiAmount: functions.emiCalculator(
                                      int.parse(areaController.text),
                                      logBookingPlansAndRatesRecord
                                          .fixedRatePerSqFt,
                                      functions.getBookingAmt(
                                          logBookingPlansAndRatesRecord
                                              .minBookingAmtPerc,
                                          logBookingPlansAndRatesRecord
                                              .fixedRatePerSqFt
                                              .toDouble(),
                                          int.parse(areaController.text)),
                                      double.parse(downPaymentController.text),
                                      emiTenureValue),
                                  emiTenureInMonths:
                                      functions.parseReplaceFromString(
                                          emiTenureValue, ' Months'),
                                  created: getCurrentTimestamp,
                                  isApproved: false,
                                  lastModified: getCurrentTimestamp,
                                  amountLeftToPay: functions.getMultiplication(
                                      logBookingPlansAndRatesRecord
                                          .fixedRatePerSqFt
                                          .toDouble(),
                                      double.parse(areaController.text)),
                                  creditStatus: true,
                                  plotNo: plotValue,
                                ),
                                'comments': [descriptionController.text],
                              };
                              await BookingsRecord.collection
                                  .doc()
                                  .set(bookingsCreateData);
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'HomePage'),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Book',
                            options: FFButtonOptions(
                              width: 180,
                              height: 50,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              textStyle: FlutterFlowTheme.of(context).title1,
                              elevation: 0,
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
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
        ),
      ),
    );
  }
}
