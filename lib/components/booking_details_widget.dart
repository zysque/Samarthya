import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingDetailsWidget extends StatefulWidget {
  const BookingDetailsWidget({
    Key key,
    this.bookingDetails,
  }) : super(key: key);

  final DocumentReference bookingDetails;

  @override
  _BookingDetailsWidgetState createState() => _BookingDetailsWidgetState();
}

class _BookingDetailsWidgetState extends State<BookingDetailsWidget> {
  bool switchListTileValue1;
  bool switchListTileValue2;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BookingsRecord>(
      stream: BookingsRecord.getDocument(widget.bookingDetails),
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
        final containerBookingsRecord = snapshot.data;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.darkBackground,
          ),
          child: SingleChildScrollView(
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
                StreamBuilder<ProjectsRecord>(
                  stream: ProjectsRecord.getDocument(
                      containerBookingsRecord.projectRef),
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
                    final containerProjectsRecord = snapshot.data;
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Project Name',
                                      style: FlutterFlowTheme.title3,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      containerProjectsRecord.projectName,
                                      style: FlutterFlowTheme.title3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Project City',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.textColor,
                                    ),
                                  ),
                                  Text(
                                    containerProjectsRecord.projectCity,
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 417,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.background,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Purchase Details',
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFFDFD8D8),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40, 10, 40, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Text(
                                      formatNumber(
                                        containerBookingsRecord
                                            .totalAmountToPay,
                                        formatType: FormatType.custom,
                                        currency: '',
                                        format: '',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ],
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
                                    Text(
                                      'Area Booked in SQFT',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Text(
                                      containerBookingsRecord.areaBookedInSqft
                                          .toString(),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ],
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
                                    Text(
                                      'Booking Amount',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Text(
                                      formatNumber(
                                        containerBookingsRecord.bookingAmount,
                                        formatType: FormatType.custom,
                                        currency: '',
                                        format: '',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ],
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
                                    Text(
                                      'Down Payment',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Text(
                                      formatNumber(
                                        containerBookingsRecord.downPayment,
                                        formatType: FormatType.custom,
                                        currency: '',
                                        format: '',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ],
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
                                    Text(
                                      'Monthly Installments',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Text(
                                      formatNumber(
                                        containerBookingsRecord.emiAmount,
                                        formatType: FormatType.custom,
                                        currency: '',
                                        format: '',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ],
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
                                    Text(
                                      'EMI Tenure (In Months)',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Text(
                                      containerBookingsRecord.emiTenureInMonths
                                          .toString(),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ],
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
                                    Text(
                                      'Booked',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          dateTimeFormat('EEEE',
                                              containerBookingsRecord.created),
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: Text(
                                            dateTimeFormat(
                                                'yMMMd',
                                                containerBookingsRecord
                                                    .created),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                    Text(
                                      'Amount Left to Pay',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Text(
                                      formatNumber(
                                        containerBookingsRecord.amountLeftToPay,
                                        formatType: FormatType.custom,
                                        currency: '',
                                        format: '',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ],
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
                                    Text(
                                      'Last Payed',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: Text(
                                            dateTimeFormat(
                                                'yMMMd',
                                                containerBookingsRecord
                                                    .lastModified),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: Text(
                                            dateTimeFormat(
                                                'jms',
                                                containerBookingsRecord
                                                    .lastModified),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                    Expanded(
                                      child: SwitchListTile(
                                        value: switchListTileValue1 ??=
                                            containerBookingsRecord.isApproved,
                                        onChanged: (newValue) => setState(() =>
                                            switchListTileValue1 = newValue),
                                        title: Text(
                                          'Approved',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.grayLight,
                                          ),
                                        ),
                                        tileColor: Color(0xFFF5F5F5),
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SwitchListTile(
                                        value: switchListTileValue2 ??=
                                            !(containerBookingsRecord
                                                .creditStatus),
                                        onChanged: (newValue) => setState(() =>
                                            switchListTileValue2 = newValue),
                                        title: Text(
                                          'Fully Paid',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.grayLight,
                                          ),
                                        ),
                                        tileColor: Color(0xFFF5F5F5),
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                    ),
                                  ],
                                ),
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
