import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'SignUp.dart';
import 'login.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: Container(
        child: Column(
          children: [
            SizedBox(height: 110.0),
            Container(
              height: 250,
              width: 500,
//                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//                margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
              child: Image(
                image: AssetImage(
                  "images/Farmer-a.png",
                ),
              ),
            ),
            Container(
                child: Column(
              children: [
                SizedBox(height: 20.0),
                Text(
                  "Welcome to ",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.black),
                ),
                Text("KrushiMitra",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 7,
                        color: Colors.orange)),
                Text("Ask Everthing About Farm!",
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.black))
              ],
            )),
            SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(width: 10),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orangeAccent,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            )
          ],
        ),
      )),
    );
  }
}
