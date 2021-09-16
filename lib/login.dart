import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
// ignore: unused_import
import 'package:keep_notes/color.dart';
import 'package:keep_notes/home.dart';
import 'package:keep_notes/service/auth.dart';
import 'package:keep_notes/service/firestore_db.dart';
import 'package:keep_notes/service/login_info.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create and Customize Your Daily Notes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 30),
                  Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_bTOdru.json'),
                  // Container(
                  //  child: Image.asset('lib/assets/note.png'),
                  // ),
                  SizedBox(height: 30),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SignInButton(Buttons.Google, onPressed: () async {
                          await signInWithGoogle();
                          // ignore: await_only_futures
                          final User? currentUser = await _auth.currentUser;
                          LocalDataSaver.saveLoginData(true);
                          LocalDataSaver.saveImg(
                              currentUser!.photoURL.toString());
                          LocalDataSaver.saveMail(currentUser.email.toString());
                          LocalDataSaver.saveName(
                              currentUser.displayName.toString());
                          LocalDataSaver.saveSyncSet(false);

                          await FireDB().getAllStoredNotes();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        })
                      ],
                    ),
                  )
                ],
              ), //  Container(child: Image.asset('lib/assets/note.png'), ),
            ],
          ),
        ),
      ),
    );
  }
}
