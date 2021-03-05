import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Profilepage.dart';
import 'SettingPage.dart';
import 'package:share/share.dart';

class MainDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isLogggedin = false;

  // getuser() async {
  //   User Firebaseuser = await _auth.currentUser;
  //   await Firebaseuser?.reload();
  //   Firebaseuser = _auth.currentUser;

  //   if (Firebaseuser != null) {
  //     setState(() {
  //       this.user = Firebaseuser;
  //       this.isLogggedin = true;
  //     });
  //   }
  // }

  // void initState() {
  //   this.getuser();
  // }

  SignOut() async {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            // color: Theme.of(context).primaryColorDark,
            color: Colors.orange,
            child: Center(
              child: Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/raj.jpg"),
                            fit: BoxFit.fill),
                      )),
                  Text(
                    // "${user.displayName}",
                    "Raj",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    // "${user.email}",
                    "@gmail.com",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Setting",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              "Share",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Share.share(
                  "Listen this song https://www.youtube.com/watch?v=kJQP7kiw5Fk Most viewed song in the world",
                  subject: "Despacito Song");
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              SignOut();
            },
          ),
        ],
      ),
    );
  }
}
