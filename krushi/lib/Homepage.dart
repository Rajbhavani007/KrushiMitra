import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";

import 'UploadImage.dart';
import 'main_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.orange,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // children: [
          //   Text(
          //     "Welcome",
          //     style: TextStyle(
          //       fontSize: 30,
          //       fontWeight: FontWeight.bold,
          //       letterSpacing: 2.0,
          //     ),
          //   ),
          //   Text(
          //     "to the",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   Text(
          //     "KrushiMitra",
          //     style: TextStyle(
          //       fontSize: 40,
          //       fontWeight: FontWeight.bold,
          //       letterSpacing: 4.0,
          //     ),
          //   )
          // ],

          children: [
            SizedBox(
              width: 350.0,
              child: ColorizeAnimatedTextKit(
                // onTap: () {
                //   print("Tap Event");
                // },
                text: ["Welcome"],

                textStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: "Agne"),
                speed: Duration(milliseconds: 100),

                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                isRepeatingAnimation: true,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 350.0,
              child: ColorizeAnimatedTextKit(
                // onTap: () {
                //   print("Tap Event");
                // },
                text: [" To "],

                textStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: "Agne"),
                speed: Duration(milliseconds: 100),

                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                isRepeatingAnimation: true,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 350.0,
              child: ColorizeAnimatedTextKit(
                // onTap: () {
                //   print("Tap Event");
                // },
                text: ["KrushiMitra"],

                textStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontFamily: "Agne"),
                speed: Duration(milliseconds: 100),

                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                isRepeatingAnimation: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>MyApp()));
        },
        highlightElevation: 10,
      ),
    );
  }
}
//abcd
//efgh
///ijklg
