import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../complete_profile/complete_profile_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterAccountWidget extends StatefulWidget {
  const RegisterAccountWidget({Key key}) : super(key: key);

  @override
  _RegisterAccountWidgetState createState() => _RegisterAccountWidgetState();
}

class _RegisterAccountWidgetState extends State<RegisterAccountWidget> {
  TextEditingController emailAddressController;
  TextEditingController passwordCreateController;
  bool passwordCreateVisibility;
  TextEditingController passwordConfirmController;
  bool passwordConfirmVisibility;
  TextEditingController referralController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordCreateController = TextEditingController();
    passwordCreateVisibility = false;
    passwordConfirmController = TextEditingController();
    passwordConfirmVisibility = false;
    referralController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.background,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.background,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.asset(
                        'assets/images/createAccount_bg@2x.png',
                      ).image,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 24, 24, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Logo.png',
                                width: 325,
                                height: 80,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Get Started',
                                      style: FlutterFlowTheme.title1,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Create your account below.',
                                        style: FlutterFlowTheme.subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: TextFormField(
                                    controller: emailAddressController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                      labelStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0x98FFFFFF),
                                      ),
                                      hintText: 'Enter your email...',
                                      hintStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0x98FFFFFF),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.darkBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 24, 20, 24),
                                    ),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.textColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: TextFormField(
                                    controller: passwordCreateController,
                                    obscureText: !passwordCreateVisibility,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0x98FFFFFF),
                                      ),
                                      hintText: 'Enter your password...',
                                      hintStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0x98FFFFFF),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.darkBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 24, 20, 24),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordCreateVisibility =
                                              !passwordCreateVisibility,
                                        ),
                                        child: Icon(
                                          passwordCreateVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0x98FFFFFF),
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.textColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: TextFormField(
                                    controller: passwordConfirmController,
                                    obscureText: !passwordConfirmVisibility,
                                    decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      labelStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0x98FFFFFF),
                                      ),
                                      hintText: 'Enter your password...',
                                      hintStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0x98FFFFFF),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.darkBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 24, 20, 24),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordConfirmVisibility =
                                              !passwordConfirmVisibility,
                                        ),
                                        child: Icon(
                                          passwordConfirmVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0x98FFFFFF),
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.textColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ToggleIcon(
                                            onPressed: () async {
                                              setState(() => FFAppState()
                                                      .hasReferral =
                                                  !FFAppState().hasReferral);
                                            },
                                            value: FFAppState().hasReferral,
                                            onIcon: Icon(
                                              Icons.check_box,
                                              color: FlutterFlowTheme.errorRed,
                                              size: 30,
                                            ),
                                            offIcon: Icon(
                                              Icons.check_box_outline_blank,
                                              color: Colors.purple,
                                              size: 30,
                                            ),
                                          ),
                                          if (FFAppState().hasReferral ?? true)
                                            Expanded(
                                              child: TextFormField(
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  'referralController',
                                                  Duration(milliseconds: 20),
                                                  () => setState(() {}),
                                                ),
                                                controller: referralController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Referral ID',
                                                  labelStyle: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0x98FFFFFF),
                                                  ),
                                                  hintText: 'Enter Referral ID',
                                                  hintStyle: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0x98FFFFFF),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  fillColor: FlutterFlowTheme
                                                      .darkBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20, 24, 20, 24),
                                                ),
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme
                                                      .textColor,
                                                ),
                                                validator: (val) {
                                                  if (val.isEmpty) {
                                                    return 'Field is required';
                                                  }
                                                  if (val.length < 20) {
                                                    return 'Requires at least 20 characters.';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().hasReferral ?? true)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: StreamBuilder<
                                                  List<UsersRecord>>(
                                                stream: queryUsersRecord(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.where('uid',
                                                          isEqualTo:
                                                              referralController
                                                                  .text),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40,
                                                        height: 40,
                                                        child:
                                                            SpinKitPumpingHeart(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          size: 40,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      buttonUsersRecordList =
                                                      snapshot.data;
                                                  final buttonUsersRecord =
                                                      buttonUsersRecordList
                                                              .isNotEmpty
                                                          ? buttonUsersRecordList
                                                              .first
                                                          : null;
                                                  return FFButtonWidget(
                                                    onPressed: () async {
                                                      if (!formKey.currentState
                                                          .validate()) {
                                                        return;
                                                      }
                                                      setState(() => FFAppState()
                                                          .validated = (FFAppState()
                                                              .hasReferral) ==
                                                          (buttonUsersRecord !=
                                                              null));
                                                      if (FFAppState()
                                                          .validated) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Correct Referral ID'),
                                                              content: Text(
                                                                  'The entered referral ID is corrrect, referral user is associated with us.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                      if (!(FFAppState()
                                                          .validated)) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Wrong Referral ID'),
                                                              content: Text(
                                                                  'The referral User doesn\'t exist, Please correct the referral ID.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                      if (!(FFAppState()
                                                          .validated)) {
                                                        setState(() {
                                                          referralController
                                                              .clear();
                                                        });
                                                      }
                                                    },
                                                    text: 'Validate',
                                                    options: FFButtonOptions(
                                                      width: 74,
                                                      height: 20,
                                                      color: Color(0xFFE485A2),
                                                      textStyle:
                                                          FlutterFlowTheme
                                                              .bodyText2,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 12,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 24),
                                  child: StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where('uid',
                                              isEqualTo:
                                                  referralController.text),
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
                                                  FlutterFlowTheme.primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord> buttonUsersRecordList =
                                          snapshot.data;
                                      final buttonUsersRecord =
                                          buttonUsersRecordList.isNotEmpty
                                              ? buttonUsersRecordList.first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          if ((FFAppState().hasReferral) ==
                                              (functions.getAndOutput(
                                                  FFAppState().hasReferral,
                                                  FFAppState().validated))) {
                                            if (passwordCreateController.text !=
                                                passwordConfirmController
                                                    .text) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Passwords don\'t match!',
                                                  ),
                                                ),
                                              );
                                              return;
                                            }

                                            final user =
                                                await createAccountWithEmail(
                                              context,
                                              emailAddressController.text,
                                              passwordCreateController.text,
                                            );
                                            if (user == null) {
                                              return;
                                            }
                                          } else {
                                            return;
                                          }
                                          if (FFAppState().hasReferral) {
                                            final userHierarchiesCreateData =
                                                createUserHierarchiesRecordData(
                                              hierarchyUser:
                                                  currentUserReference,
                                              referralParent:
                                                  buttonUsersRecord.reference,
                                              hierarchyUserEmail:
                                                  currentUserEmail,
                                              hasParent: false,
                                              hasReferral: true,
                                            );
                                            await UserHierarchiesRecord
                                                .collection
                                                .doc()
                                                .set(userHierarchiesCreateData);
                                          }
                                          if (!(FFAppState().hasReferral)) {
                                            final delinkedUsersCreateData =
                                                createDelinkedUsersRecordData(
                                              userRef: currentUserReference,
                                              userEmail: currentUserEmail,
                                            );
                                            await DelinkedUsersRecord.collection
                                                .doc()
                                                .set(delinkedUsersCreateData);
                                          }
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CompleteProfileWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                        text: 'Create Account',
                                        options: FFButtonOptions(
                                          width: 160,
                                          height: 50,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle: FlutterFlowTheme.bodyText2,
                                          elevation: 3,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 30,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .leftToRight,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  reverseDuration: Duration(
                                                      milliseconds: 200),
                                                  child: LoginPageWidget(),
                                                ),
                                              );
                                            },
                                            text: 'Login',
                                            icon: Icon(
                                              Icons.arrow_back_rounded,
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              size: 16,
                                            ),
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.background,
                                              textStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
                                          ),
                                          Text(
                                            'Already have an account?',
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
