import "package:flutter/material.dart";
import "main_drawer.dart";

class ForumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("FORUM"),
         backgroundColor: Colors.orange,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          "We are in Forum Page now",
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
