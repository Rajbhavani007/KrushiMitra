import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:krushi/main.dart';

import 'Homepage.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;

  @override
  void initState() {
    super.initState();
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(children: [
          SizedBox(height: 90.0),
          Container(
            height: 300,
            width: 500,
//                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//                margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
            child: Image(
              image: AssetImage(
                "images/Farmer-b.png",
              ),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: (input) {
                        if (input.isEmpty) return 'Enter Email';
                      },
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          icon: Icon(Icons.lock),
                          border: OutlineInputBorder()),
                      validator: (input) {
                        if (input.length < 6)
                          return 'Provide minimum 6 Character';
                      },
                      obscureText: true,
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                    onPressed: () async {
                      print("IN");
                      try {
                        var user = await _auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        if (user != null) {
                          print("In1");
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
