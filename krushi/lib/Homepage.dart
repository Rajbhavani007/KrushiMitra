

import 'dart:io';
import "package:flutter/material.dart";

import 'package:firebase_auth/firebase_auth.dart';
import 'package:krushi/UploadImage.dart';

import 'Start.dart';
import 'constants.dart';
import 'content.dart';
import 'data.dart';
import 'main_drawer.dart';
import 'productdetail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogggedin = false;
  User user;

  get floatingActionButton => null;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Start()));
      }
    });
  }

  getuser() async {
    User Firebaseuser = await _auth.currentUser;
    await Firebaseuser?.reload();
    Firebaseuser = _auth.currentUser;

    if (Firebaseuser != null) {
      setState(() {
        this.user = Firebaseuser;
        this.isLogggedin = true;
      });
    }
  }

  void initState() {
    this.checkAuthentification();
    this.getuser();
  }

  SignOut() async {
    _auth.signOut();

    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Start()));
  }

// krushiiiiiii
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page",style: TextStyle(color:Colors.black,
        fontWeight:FontWeight.bold ) ,),
          backgroundColor: Colors.white,
          // iconTheme: IconThemeData(color: Colors.green),
        leading: IconButton(
          icon: Icon(Icons.sort),
           color: Colors.green,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        ),
        drawer: MainDrawer(),
      body:
       SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                       SizedBox(
                    height: 20,
                  ),

                  Text('KrushiMitras Products',
                  style:
                    TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                  ),



                  buildTextSubTitleVariation1('Provides solution from seeds to market'),

                  SizedBox(
                    height: 25,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      option('Fertilizers', 0),
                      //SizedBox(
                        //width: 8,
                      //),
                      option('Pestisides', 1),
                      //SizedBox(
                        //width: 8,
                      //),
                      option('Insectisides', 2),




                    ],
                  ),

                ],
              ),
            ),
           SizedBox(
             height: 26,
           ),
           Container(
               padding: EdgeInsets.symmetric(horizontal: 16),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 buildTextTitleVariation2('Premium', false),

                 SizedBox(
                   width: 8,
                 ),

                 buildTextTitleVariation2('Seeds', false),
               ],)

           ),


            Container(

              padding: EdgeInsets.only(left: 260),
                child: Row(

                  children: [
                    Text('View All',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold
                    ),),

                  ],
                ),
            ),

            SizedBox(
              height: 4,
            ),
            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildData(),
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  buildTextTitleVariation2('Popular', false),

                  SizedBox(
                    width: 8,
                  ),

                  buildTextTitleVariation2('Fertilizers', false),

                ],
              ),

            ),
            SizedBox(
              height: 0,
            ),
            Container(
              padding: EdgeInsets.only(left: 260),
              child: Row(

                children: [
                  Text('View All',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold
                    ),),

                ],
              ),
            ),


            Container(
              height: 190,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: buildPopulars(),
              ),
            ),

          ],
        ),
      ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          foregroundColor: Colors.black,
          backgroundColor: Colors.green[300],
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UploadImage()));
          },
          highlightElevation: 10,
        ),
      ),
    );
  }



Widget option(String text, int index){
    List<bool> optionSelected = [true, false, false];
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index] ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildData([Products product]){
    List<Widget> list = [];
    for (var i = 0; i < getProducts().length; i++) {
      list.add(buildDatas(getProducts()[i], i));
    }
    return list;
  }

  Widget buildDatas(Products products, int index){
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => Detail(products: products)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Hero(
                tag: products.image,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(products.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),

            buildProductsTitle(products.title),

            buildTextSubTitleVariation2(products.description),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                buildPrices(products.price.toString() + " Rs"),

                Icon(
                  Icons.favorite_border,
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  List<Widget> buildPopulars(){
    List<Widget> list = [];
    for (var i = 0; i < getProducts().length; i++) {
      list.add(buildPopular(getProducts()[i]));
    }
    return list;
  }

  Widget buildPopular(Products products){
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [

          Container(
            height: 140,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(products.image),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  buildProductsTitle(products.title),

                  buildProductsSubTitle(products.description),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      buildPrices(products.price.toString() + " Rs"),

                      Icon(
                        Icons.favorite_border,
                      )

                    ],
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}