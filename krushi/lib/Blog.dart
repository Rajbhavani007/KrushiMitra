import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:krushi/UploadBlog.dart';
import 'package:krushi/blogs.dart';

import 'main_drawer.dart';

import 'CommentPage.dart';

class Blog extends StatefulWidget {
  Blog({Key keys, this.title}) : super(key: keys);
  String title;

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  List<Blogs> blogsList = [];

  void initState() {
    super.initState();
    DatabaseReference BlogsRef =
        FirebaseDatabase.instance.reference().child("blogs");

    BlogsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      blogsList.clear();

      for (var individualKey in KEYS) {
        Blogs blogpost = new Blogs(
          DATA[individualKey]["blogtitle"],
          DATA[individualKey]["time"],
          DATA[individualKey]["date"],
          DATA[individualKey]["blog"],
          DATA[individualKey]["username"],
        );

        blogsList.add(blogpost);
      }

      setState(() {
        print('Length : $blogsList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blog",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        leading: IconButton(
          icon: Icon(Icons.sort),
          color: Colors.green,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text("Creat Blog"),
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadBlog()));
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        color: Colors.white,
        child: blogsList.length == 0
            ? LinearProgressIndicator(
                backgroundColor: Colors.green,
              )
            : new ListView.builder(
                itemCount: blogsList.length,
                itemBuilder: (BuildContext context, index) {
                  return BlogUI(
                    blogsList[index].blogtitle,
                    blogsList[index].time,
                    blogsList[index].date,
                    blogsList[index].blog,
                    blogsList[index].username,
                  );
                }),
      ),
    );
  }

  Widget BlogUI(String blogtitle, String time, String date, String blog,
      String username) {
    return new Card(
      elevation: 8.0,
      color: Colors.grey[200],
      shadowColor: Colors.blueGrey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(7.0),
      // margin: EdgeInsets.only(bottom:10),
      child: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.only(top: 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("images/raj.jpg"),
                                  fit: BoxFit.fill),
                            )),
                        Container(
                          child: new Text(
                            username,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Text(
                    date,
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  time,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.end,
                ),
              ]),
              SizedBox(height: 5.0),
              Container(
                child: new Text(
                  blogtitle,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5.0),

              Container(
                  height: 200,
                  width:330,
                  
                  child: SingleChildScrollView(
                    child: new Text(blog,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.start),
                  )),

              SizedBox(height: 5.0),
            ],
          )),
    );
  }
}
