
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'SignUp.dart';
import 'login.dart';
import 'main.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();


  Future<User> _signup(BuildContext context) async {
 
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        print(googleAuth);

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(credential);
      
   User user = (await _auth.signInWithCredential(credential)).user;
   print(user.providerData);
   
  
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));

    return user;


     }

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
                        color: Colors.green[900])),
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
                    color: Colors.green,
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
                    color: Colors.green,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SignInButton(Buttons.Google,
                text: "Sign up with Google",
                onPressed: () => _signup(context)
                    .then(( User user) => print(user))
                    .catchError((e)=> print(e))),
          ],
        ),
      )),
    );
  }
}

class UserDetails {
  // final String providerDetails;
  final String userName;
  // final String photoUrl;
  final String userEmail;
  // final List<ProviderDetails> providerData;
  // UserDetails(this.providerDetails, this.userName, this.photoUrl,
  //     this.userEmail, this.providerData);

      UserDetails (this.userName,
      this.userEmail);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
