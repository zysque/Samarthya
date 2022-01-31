import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateEMIWidget extends StatefulWidget {
  const CalculateEMIWidget({
    Key key,
    this.planRef,
  }) : super(key: key);

  final DocumentReference planRef;

  @override
  _CalculateEMIWidgetState createState() => _CalculateEMIWidgetState();
}

class _CalculateEMIWidgetState extends State<CalculateEMIWidget> {
  String emiTenureValue;
  TextEditingController areaController;
  TextEditingController downPaymentController;

  @override
  void initState() {
    super.initState();
    areaController = TextEditingController();
    downPaymentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.darkBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.solidWindowClose,
                        color: Color(0xFF810933),
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: StreamBuilder<PlansAndRatesRecord>(
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
                  final bookingDetailsPlansAndRatesRecord = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: TextFormField(
                          controller: areaController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Plot Area',
                            labelStyle: FlutterFlowTheme.subtitle2,
                            hintText: 'Please enter plot area in sqft',
                            hintStyle: FlutterFlowTheme.subtitle2,
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
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          ),
                          style: FlutterFlowTheme.subtitle2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Rate per SQFT',
                              style: FlutterFlowTheme.subtitle2,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.rupeeSign,
                                color: FlutterFlowTheme.grayLight,
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                bookingDetailsPlansAndRatesRecord
                                    .fixedRatePerSqFt
                                    .toString(),
                                style: FlutterFlowTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Booking Amount',
                              style: FlutterFlowTheme.subtitle2,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.rupeeSign,
                                color: FlutterFlowTheme.grayLight,
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                functions
                                    .getBookingAmt(
                                        bookingDetailsPlansAndRatesRecord
                                            .minBookingAmtPerc,
                                        bookingDetailsPlansAndRatesRecord
                                            .fixedRatePerSqFt
                                            .toDouble(),
                                        double.parse(areaController.text))
                                    .toString(),
                                style: FlutterFlowTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: TextFormField(
                          controller: downPaymentController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Down Payment',
                            labelStyle: FlutterFlowTheme.subtitle2,
                            hintText: 'Please enter down payment',
                            hintStyle: FlutterFlowTheme.subtitle2,
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
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          ),
                          style: FlutterFlowTheme.subtitle2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: FlutterFlowDropDown(
                          options: bookingDetailsPlansAndRatesRecord
                              .emiTenureOptions
                              .toList()
                              .toList(),
                          onChanged: (val) =>
                              setState(() => emiTenureValue = val),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          textStyle: FlutterFlowTheme.subtitle2,
                          hintText: 'Select EMI Tenure',
                          fillColor: FlutterFlowTheme.darkBackground,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 4, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Monthly Installments',
                          style: FlutterFlowTheme.title3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.rupeeSign,
                                color: Color(0xFF7CD514),
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                functions
                                    .emiCalculator(
                                        int.parse(areaController.text),
                                        bookingDetailsPlansAndRatesRecord
                                            .fixedRatePerSqFt,
                                        functions.getBookingAmt(
                                            bookingDetailsPlansAndRatesRecord
                                                .minBookingAmtPerc,
                                            bookingDetailsPlansAndRatesRecord
                                                .fixedRatePerSqFt
                                                .toDouble(),
                                            double.parse(areaController.text)),
                                        double.parse(
                                            downPaymentController.text),
                                        emiTenureValue)
                                    .toString(),
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF7CD514),
                                ),
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
          ],
        ),
      ),
    );
  }
}
