import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:saamarth/login_page/login_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'my_sales/my_sales_widget.dart';
import 'my_commissions/my_commissions_widget.dart';
import 'my_profile_page/my_profile_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<SaamarthFirebaseUser> userStream;
  SaamarthFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = saamarthFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saamarth',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/Splash.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'MySales';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'MySales': MySalesWidget(),
      'MyCommissions': MyCommissionsWidget(),
      'MyProfilePage': MyProfilePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) =>
            setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.darkBackground,
        color: FlutterFlowTheme.grayLight,
        activeColor: FlutterFlowTheme.primaryColor,
        tabBackgroundColor: Color(0x00000000),
        tabBorderRadius: 100,
        tabMargin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        gap: 0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        duration: Duration(milliseconds: 500),
        haptic: false,
        tabs: [
          GButton(
            icon: currentIndex == 0
                ? Icons.stacked_line_chart_rounded
                : Icons.stacked_line_chart_rounded,
            text: '',
            iconSize: 24,
          ),
          GButton(
            icon: currentIndex == 1
                ? Icons.stacked_line_chart_rounded
                : Icons.account_balance_wallet_rounded,
            text: '',
            iconSize: 24,
          ),
          GButton(
            icon: currentIndex == 2
                ? Icons.account_circle_rounded
                : Icons.account_circle_outlined,
            text: '',
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
