import "package:flutter/material.dart";
import "main_drawer.dart";

class ForumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("FORUM",style: TextStyle(color: Colors.black),),
         backgroundColor: Colors.white,
          // iconTheme: IconThemeData(color: Colors.green),
          leading: IconButton(
          icon: Icon(Icons.sort),
           color: Colors.green,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
         
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
