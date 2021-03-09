import "package:flutter/material.dart";

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.green),
      ),
      body: Center(
        child: Text(
          "We are in Setting Page now",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
