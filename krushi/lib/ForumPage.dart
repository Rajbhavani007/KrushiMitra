import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'Posts.dart';
import 'UploadImage.dart';
import "main_drawer.dart";
// import 'package:firebase_database/firebase_database.dart';

class ForumPage extends StatefulWidget {
  ForumPage({Key keys, this.title}) : super(key: keys);
  final String title;
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<ForumPage> {
  List<Posts> postsList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference PostsRef =
        FirebaseDatabase.instance.reference().child("posts");

    PostsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postsList.clear();

      for (var individualKey in KEYS) {
        Posts posts = new Posts(
          DATA[individualKey]["image"],
          DATA[individualKey]["description"],
          DATA[individualKey]["date"],
          DATA[individualKey]["problem"],
          DATA[individualKey]["time"],
          DATA[individualKey]["username"],
        );

        postsList.add(posts);
      }

      setState(() {
        print('Length : $postsList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FORUM",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        // iconTheme: IconThemeData(color: Colors.green),
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
              child: Text("Creat Post"),
              onPressed: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => UploadImage()));},
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        color: Colors.black,
        child: postsList.length == 0
            ? 
            // new Text(
            //     "No Post Available Here ",
            //     textAlign: TextAlign.center,
            //   ),
             LinearProgressIndicator(backgroundColor: Colors.green,)
            : new ListView.builder(
                itemCount: postsList.length,
                itemBuilder: (BuildContext context, index) {
                  return PostsUI(
                    postsList[index].image,
                    postsList[index].description,
                    postsList[index].time,
                    postsList[index].date,
                    postsList[index].problem,
                    postsList[index].username,
                  );
                }),
      ),
    );
  }

  Widget PostsUI(String image, String description, String problem, String date,
      String time, String username) {
    return new Card(
      elevation: 8.0,
      color:Colors.grey[200],
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
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: new Text(
                      username,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  new Text(
                    date,
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
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
              new Image.network(
                image,
                height: 250,
                width: 450,
              ),
              SizedBox(height: 5.0),
              new Text(
                description,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.0),
              new Text(problem,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.start),
            ],
          )),
    );
  }
}
