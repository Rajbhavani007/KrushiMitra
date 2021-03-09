import 'package:flutter/material.dart';

import 'constants.dart';
import 'content.dart';
import 'data.dart';


class Detail extends StatelessWidget {

  final Products products;

  Detail({@required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  buildTextTitleVariation1(products.title),

                  buildTextSubTitleVariation1(products.description),

                ],
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Container(
              height: 310,
              padding: EdgeInsets.only(left: 16),
              child: Stack(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      buildTextTitleVariation2('Basic Details', false),

                      SizedBox(
                        height: 16,

                      ),

                      buildDetails(products.price, "Price", "rupee"),

                      SizedBox(
                        height: 16,
                      ),

                      buildDetails(products.weight, "Weight", "Kg"),

                      SizedBox(
                        height: 16,
                      ),

                      buildDetails(products.percent, "Effective", "percentage"),

                    ],
                  ),

                  Positioned(
                    right: -80,
                    child: Hero(
                      tag: products.image,
                      child: Container(
                        height: 310,
                        width: 310,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(products.image),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  buildTextTitleVariation2('Additional Details', false),

                  buildTextSubTitleVariation1(products.content),
                  buildTextSubTitleVariation1(products.dosage),
                  buildTextSubTitleVariation1(products.type),


                  SizedBox(height: 16,),

                  buildTextTitleVariation2('Description and Uses', false),

                  buildTextSubTitleVariation1(products.detail),

                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          icon: Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 32,
          ),
          label: Text(
            "Watch Video",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
    );
  }

  Widget buildDetails(int value, String title, String subTitle){
    return Container(
      height: 60,
      width: 150,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [

          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [kBoxShadow],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(
            width: 20,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

}