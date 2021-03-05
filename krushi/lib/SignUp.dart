import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Homepage.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password;

  @override
  void initState() {
    super.initState();
  }

  SignUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: _name);
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
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
                "images/Farmer-c.png",
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
                        labelText: 'Name',
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      validator: (input) {
                        if (input.isEmpty) return 'Enter name';
                      },
                      onSaved: (input) => _name = input,
                    ),
                  ),
                  SizedBox(height: 15.0),
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
                      onSaved: (input) => _email = input,
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
                      onSaved: (input) => _password = input,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                    onPressed: SignUp,
                    child: Text('SignUp',
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
