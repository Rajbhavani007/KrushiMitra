import "package:flutter/material.dart";
import 'package:krushi/Profilepage.dart';

class Editprofile extends StatefulWidget {
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.green,

        // ),
        leading: GestureDetector(
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),

      //  appBar: AppBar(
      //   title: Text("Setting",style: TextStyle(color: Colors.black),),
      //     backgroundColor: Colors.white,
      //     iconTheme: IconThemeData(color: Colors.green),
      // ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 50),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  child: ClipOval(
                    child: Image.asset(
                      'images/raj.jpg',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ))
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          icon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                    child: Text('Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      print("Update profile");
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
