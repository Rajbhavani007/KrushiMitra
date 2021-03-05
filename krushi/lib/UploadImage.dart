import 'dart:io';
import 'dart:convert';
import 'dart:async';
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String title = 'Stepper';
  StepperType _stepperType = StepperType.vertical;
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Stepper(
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
              this._currentStep = this._currentStep + 1;
            } else {
              print("complete");
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
    );
  }

  File _image;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
          title: Text('Image'),
          content: Column(
            children: <Widget>[
              Text('Upload your image here',
                  style: TextStyle(color: Colors.grey)),
              _image == null ? Text("Image not Loaded") : Image.file(_image),
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
                decoration: InputDecoration(labelText: 'First name'),
              ),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.disabled),
      Step(
          title: Text('Problem'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'First name'),
              ),
            ],
          ),
          isActive: _currentStep >= 2,
          state: StepState.disabled),
    ];

    return _steps;
  }
}

Widget showImage() {
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  return FutureBuilder<File>(
    future: file,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          null != snapshot.data) {
        tmpFile = snapshot.data;
        base64Image = base64Encode(snapshot.data.readAsBytesSync());
        return Flexible(
          child: Image.file(
            snapshot.data,
            fit: BoxFit.fill,
          ),
        );
      } else if (null != snapshot.error) {
        return const Text(
          'Error Picking Image',
          textAlign: TextAlign.center,
        );
      } else {
        return const Text(
          'No Image Selected',
          textAlign: TextAlign.center,
        );
      }
    },
  );
}
