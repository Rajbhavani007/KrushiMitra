import "package:flutter/material.dart";
import 'main_drawer.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text("Serarch"),
         backgroundColor: Colors.orange,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          "We are in Search Page now",
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





