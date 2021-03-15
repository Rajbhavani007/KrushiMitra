import 'dart:io';

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import "package:image_picker/image_picker.dart";
import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:krushi/main.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  bool isuploading = false;
  String title = 'Upload post';

  var fnamecon = TextEditingController();
  var probcon = TextEditingController();
  StepperType _stepperType = StepperType.vertical;
  int _currentStep = 0;
  bool require = false;
  void handleSubmit() {
    setState(() {
      isuploading = true;
      uploadStatusImage();
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
              onPressed: isuploading ? null : () => handleSubmit(),
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
                //  type: switchStepsType,
                onStepTapped: (step) {
                  setState(() {
                    this._currentStep = step;
                  });
                },

                onStepContinue: () {
                  setState(() {
                    if (this._currentStep < this._stepper().length - 1) {
                      if (fnamecon.text.isNotEmpty || _currentStep == 0) {
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
                      if (probcon.text.isNotEmpty) {
                        Fluttertoast.showToast(
                            msg: " Ready to Post",
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
                      // print("complete");

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

  File _image;
  String _myValue;
  String myvalue;
  String url;
  String _myProblem;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void uploadStatusImage() async {
    final Reference postImageRef =
        FirebaseStorage.instance.ref().child("Post Image");

    var timekey = new DateTime.now();

    final UploadTask uploadTask =
        postImageRef.child(timekey.toString() + ".jpg").putFile(_image);
   

    var Imageurl = await (await uploadTask).ref.getDownloadURL();
    
    // // print("product name = " + myvalue);
    url = Imageurl.toString();
    print("Image url = " + url);

    saveToDatabase(url);
    goToforumpage();
  }

  void saveToDatabase(url) {
    var dbTimekey = new DateTime.now();
    var formatdate = new DateFormat('MMM d , yyyy');
    var formatTime = new DateFormat('EEE, hh:mm aaa ');

    String date = formatdate.format(dbTimekey);
    String time = formatTime.format(dbTimekey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {
      "Description ": fnamecon.text,
      "image": url,
      "date": date,
      "time": time,
      "Problem ": probcon.text,
    };

    ref.child("posts").push().set(data);
  }

  void goToforumpage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
          title: Text('Image'),
          content: Column(
            children: <Widget>[
              Text('Upload your image here',
                  style: TextStyle(color: Colors.grey)),
              _image == null
                  ? Text("Image not Loaded")
                  : Image.file(
                      _image,
                      height: 250,
                      width: 350,
                    ),
              FlatButton(
                onPressed: () {
                  getImage();
                },
                child: Text('Upload',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                textColor: Colors.black,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(8.0),
              )
            ],
          ),
          isActive: _currentStep >= 0,
          state: StepState.disabled),
      Step(
          title: Text('Product'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: fnamecon,
                decoration: InputDecoration(
                    labelText: 'First name',
                    errorText: require ? "Value cannot be empty" : null),
              ),

              // TextFormField(
              //   keyboardType: TextInputType.text,
              //   autocorrect: false,
              //   onSaved: (String value) {
              //     _myValue = value;
              //   },
              //   maxLines: 1,
              //   //initialValue: 'Aseem Wangoo',
              //   validator: (value) {
              //     if (value.isEmpty || value.length < 1) {
              //       return 'Please enter name';
              //     }
              //   },
              //   decoration:  InputDecoration(
              //       labelText: 'Enter your name',
              //       hintText: 'Enter a name',
              //       //filled: true,
              //       icon: const Icon(Icons.person),
              //       labelStyle:
              //        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              // ),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.disabled),
      Step(
          title: Text('Problem'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Write a problem",
                    errorText: require ? "Value can't be empty" : null),
                controller: probcon,
              ),
            ],
          ),
          isActive: _currentStep >= 2,
          state: StepState.disabled),
    ];
    return _steps;
  }
}