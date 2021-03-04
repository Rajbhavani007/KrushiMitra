// import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import "main_drawer.dart";

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
         backgroundColor: Colors.orange,
      ),
       drawer: MainDrawer(),
      body: Center(
        child: Text(
          "We are in Profle Page now",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87
          ),     
        ),
        
       
      ),
    );
  }
}
