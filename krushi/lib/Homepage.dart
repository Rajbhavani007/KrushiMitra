import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";

import 'package:firebase_auth/firebase_auth.dart';
import 'package:krushi/UploadImage.dart';

import 'Start.dart';
import 'main_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogggedin = false;
  User user;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Start()));
      }
    });
  }

  getuser() async {
    User Firebaseuser = await _auth.currentUser;
    await Firebaseuser?.reload();
    Firebaseuser = _auth.currentUser;

    if (Firebaseuser != null) {
      setState(() {
        this.user = Firebaseuser;
        this.isLogggedin = true;
      });
    }
  }

  void initState() {
    this.checkAuthentification();
    this.getuser();
  }

  SignOut() async {
    _auth.signOut();

    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Start()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.orange,
        ),
        drawer: MainDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350.0,
                child: ColorizeAnimatedTextKit(
                  // onTap: () {
                  //   print("Tap Event");
                  // },
                  text: ["Welcome"],

                  textStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: "Agne"),
                  speed: Duration(milliseconds: 100),

                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  isRepeatingAnimation: true,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 350.0,
                child: ColorizeAnimatedTextKit(
                  // onTap: () {
                  //   print("Tap Event");
                  // },
                  text: [" To "],

                  textStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: "Agne"),
                  speed: Duration(milliseconds: 100),

                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  isRepeatingAnimation: true,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 350.0,
                child: ColorizeAnimatedTextKit(
                  // onTap: () {
                  //   print("Tap Event");
                  // },
                  text: ["KrushiMitra"],

                  textStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      fontFamily: "Agne"),
                  speed: Duration(milliseconds: 100),

                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  isRepeatingAnimation: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UploadImage()));
          },
          highlightElevation: 10,
        ),
      ),
    );
  }
}
