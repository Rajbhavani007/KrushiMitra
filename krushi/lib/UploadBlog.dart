import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:krushi/Blog.dart';
import 'package:krushi/main.dart';


class UploadBlog extends StatefulWidget {
  @override
  _UploadBlogState createState() => _UploadBlogState();
}

class _UploadBlogState extends State<UploadBlog> {
  bool isuploading = false;
  String title = 'Upload Blog';

  var bnamecon = TextEditingController();
  var bprobcon = TextEditingController();
  StepperType _stepperType = StepperType.vertical;
  int _currentStep = 0;
  bool require = false;
  void handleSubmit() {
    setState(() {
      isuploading = true;
      // uploadStatusImage();
      saveToDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text("Post"),
              onPressed: isuploading ? null: () => handleSubmit(),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: SingleChildScrollView(
        child: Theme(
          data: ThemeData(
              accentColor: Colors.green,
              primarySwatch: Colors.green,
              colorScheme: ColorScheme.light(primary: Colors.green)),
          child: Column(
            children: [
              isuploading ? LinearProgressIndicator() : Text(" "),
              Stepper(
                steps: _stepper(),
                physics: ClampingScrollPhysics(),
                currentStep: this._currentStep,
                type: _stepperType,
                onStepTapped: (step) {
                  setState(() {
                    this._currentStep = step;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (this._currentStep < this._stepper().length - 1) {
                      if (bnamecon.text.isNotEmpty) {
                        this._currentStep = this._currentStep + 1;
                        setState(() {
                          require = false;
                        });
                      } else {
                        setState(() {
                          require = true;
                        });
                      }
                    } else {
                      if (bprobcon.text.isNotEmpty) {
                        Fluttertoast.showToast(
                            msg: " Ready your Blog",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        setState(() {
                          require = false;
                        });
                      } else {
                        setState(() {
                          require = true;
                        });
                      }
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (this._currentStep > 0) {
                      this._currentStep = this._currentStep - 1;
                    } else {
                      this._currentStep = 0;
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

final FirebaseAuth _auth = FirebaseAuth.instance;



void saveToDatabase() {
    var dbTimekey = new DateTime.now();

    var formatdate = new DateFormat('MMM d , yyyy');
    var formatTime = new DateFormat('EEE, hh:mm aaa ');

    String date = formatdate.format(dbTimekey);
    String time = formatTime.format(dbTimekey);

    String _bname  =  bnamecon.text;
    String _blog  =  bprobcon.text;
    String _username = _auth.currentUser.displayName;

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {
      "blogtitle":_bname,
      "date": date,
      "time": time,
      "blog":_blog,
      "username":_username,
    
    };

    ref.child("blogs").push().set(data);
    goToforumpage();

  }

  void goToforumpage() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp()));
  }



  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
          title: Text(' Blog Title'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: bnamecon,
                decoration: InputDecoration(
                    labelText: 'Blog Title',
                    errorText: require ? "Value cannot be empty" : null),
              ),
            ],
          ),
          isActive: _currentStep >= 0,
          state: StepState.disabled),
      Step(
          title: Text('Blog'),
          content: Column(
            children: <Widget>[
              TextFormField(
                minLines:
                    6, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    labelText: "Write a Somethig ",
                    errorText: require ? "Value can't be empty" : null),
                controller: bprobcon,
              ),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.disabled),
    ];
    return _steps;
  }
}
