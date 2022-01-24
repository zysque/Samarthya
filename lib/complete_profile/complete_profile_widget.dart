import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CompleteProfileWidget extends StatefulWidget {
  const CompleteProfileWidget({Key key}) : super(key: key);

  @override
  _CompleteProfileWidgetState createState() => _CompleteProfileWidgetState();
}

class _CompleteProfileWidgetState extends State<CompleteProfileWidget>
    with TickerProviderStateMixin {
  String dropDownValue;
  String uploadedFileUrl = '';
  TextEditingController yourNameController;
  TextEditingController yourPhoneController;
  TextEditingController yourReferralIDController;
  TextEditingController yourDOBController;
  TextEditingController yourAddressController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'circleImageOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 19),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 20),
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
      delay: 100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 20),
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
      delay: 100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 20),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
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
    'textFieldOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 400,
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

    yourAddressController = TextEditingController();
    yourDOBController = TextEditingController();
    yourNameController = TextEditingController();
    yourPhoneController = TextEditingController();
    yourReferralIDController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFF14181B),
          automaticallyImplyLeading: false,
          title: Text(
            'Complete Profile',
            style: FlutterFlowTheme.title3,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: FlutterFlowTheme.background,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: Image.asset(
                'assets/images/login_bg@2x.png',
              ).image,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                        child: FlutterFlowDropDown(
                          options: ['Mr.', 'Ms.', 'Mrs.'].toList(),
                          onChanged: (val) =>
                              setState(() => dropDownValue = val),
                          width: 80,
                          height: 50,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.grayDark,
                          ),
                          hintText: 'Title',
                          fillColor: FlutterFlowTheme.darkBackground,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                              backgroundColor: FlutterFlowTheme.darkBackground,
                              textColor: FlutterFlowTheme.textColor,
                              pickerFontFamily: 'Lexend Deca',
                            );
                            if (selectedMedia != null &&
                                validateFileFormat(
                                    selectedMedia.storagePath, context)) {
                              showUploadMessage(context, 'Uploading file...',
                                  showLoading: true);
                              final downloadUrl = await uploadData(
                                  selectedMedia.storagePath,
                                  selectedMedia.bytes);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              if (downloadUrl != null) {
                                setState(() => uploadedFileUrl = downloadUrl);
                                showUploadMessage(context, 'Success!');
                              } else {
                                showUploadMessage(
                                    context, 'Failed to upload media');
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                uploadedFileUrl,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/finance-app-sample-kugwu4/assets/ijvuhvqbvns6/uiAvatar@2x.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).animated(
                            [animationsMap['circleImageOnPageLoadAnimation']]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
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
                      fillColor: FlutterFlowTheme.darkBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.textColor,
                    ),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ).animated([animationsMap['textFieldOnPageLoadAnimation1']]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourPhoneController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
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
                      fillColor: FlutterFlowTheme.darkBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.textColor,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Field is required';
                      }
                      if (val.length < 10) {
                        return 'Requires at least 10 characters.';
                      }
                      return null;
                    },
                  ).animated([animationsMap['textFieldOnPageLoadAnimation2']]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where('uid',
                          isEqualTo: yourReferralIDController.text),
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
                      List<UsersRecord> yourReferralIDUsersRecordList =
                          snapshot.data;
                      final yourReferralIDUsersRecord =
                          yourReferralIDUsersRecordList.isNotEmpty
                              ? yourReferralIDUsersRecordList.first
                              : null;
                      return TextFormField(
                        onFieldSubmitted: (_) async {
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                          if (!(yourReferralIDUsersRecord != null)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Wrong Referral ID'),
                                  content: Text(
                                      'You have entered wrong referral ID, Please enter correct referral ID. '),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        controller: yourReferralIDController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Referral ID',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.grayLight,
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
                          fillColor: FlutterFlowTheme.darkBackground,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.textColor,
                        ),
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Field is required';
                          }
                          if (val.length < 5) {
                            return 'Requires at least 5 characters.';
                          }
                          return null;
                        },
                      ).animated(
                          [animationsMap['textFieldOnPageLoadAnimation3']]);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourDOBController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your DOB',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      hintText: 'DD/MM/YYYY',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
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
                      fillColor: FlutterFlowTheme.darkBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.textColor,
                    ),
                    keyboardType: TextInputType.datetime,
                  ).animated([animationsMap['textFieldOnPageLoadAnimation4']]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: yourAddressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Your Address',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.grayLight,
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
                        fillColor: FlutterFlowTheme.darkBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.textColor,
                      ),
                      keyboardType: TextInputType.multiline,
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation5']]),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(currentUserReference),
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
                      final buttonLoginUsersRecord = snapshot.data;
                      return FFButtonWidget(
                        onPressed: () async {
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                          final usersUpdateData = createUsersRecordData(
                            userTitle: dropDownValue,
                            photoUrl: uploadedFileUrl,
                            displayName: yourNameController.text,
                            phoneNumber: yourPhoneController.text,
                            address: yourAddressController.text,
                            dob: yourDOBController.text,
                          );
                          await buttonLoginUsersRecord.reference
                              .update(usersUpdateData);

                          final delinkedUsersCreateData =
                              createDelinkedUsersRecordData(
                            userRef: buttonLoginUsersRecord.reference,
                            userEmail: buttonLoginUsersRecord.email,
                            userName: yourNameController.text,
                            referralUid: yourReferralIDController.text,
                          );
                          await DelinkedUsersRecord.collection
                              .doc()
                              .set(delinkedUsersCreateData);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'MyProfilePage'),
                            ),
                          );
                        },
                        text: 'Complete Profile',
                        options: FFButtonOptions(
                          width: 230,
                          height: 50,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.textColor,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 30,
                        ),
                      ).animated([animationsMap['buttonOnPageLoadAnimation']]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
