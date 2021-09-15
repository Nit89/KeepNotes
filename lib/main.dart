import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keep_notes/home.dart';
import 'package:keep_notes/login.dart';
import 'package:keep_notes/service/login_info.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogIn = false;

  getLoggedInState() async {
    await LocalDataSaver.getLogData().then((value) {
      setState(() {
        isLogIn = value.toString() == "null";
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Keep Notes',
        home: AnimatedSplashScreen(
            duration: 400,
            splash: Icons.note_alt_rounded,
            nextScreen: isLogIn ? Login() : Home(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.rightToLeft,
            backgroundColor: Colors.blue));
  }
}
//isLogIn ? Login() : Home(),