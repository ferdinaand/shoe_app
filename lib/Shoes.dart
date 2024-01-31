import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shoe_app/global_widgets/text.ui.dart';
import 'package:shoe_app/resources/colors.res.dart';

class Shoes extends StatefulWidget {
  final String image;
  final String tag;

  const Shoes({Key? key, required this.image, required this.tag})
      : super(key: key);

  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 800;
    final buttonHeight = isLargeScreen ? 100.0 : 50.0;
    final cardWidth = isLargeScreen ? 250.0 : 150.0;
    final textsize = isLargeScreen ? 5.0 : 10.0;
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: widget.tag,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FadeInUp(
                              duration: Duration(milliseconds: 1300),
                              child: TextUi.headingBold1(
                                "Sneakers",
                                color: white,
                              )),
                          SizedBox(
                            height: 25,
                          ),
                          FadeInUp(
                              duration: Duration(milliseconds: 1400),
                              child: TextUi.bodyLBold("Size", color: white)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              FadeInUp(
                                  duration: Duration(milliseconds: 1450),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                        child: TextUi.bodyMedBold(
                                      "42",
                                      color: white,
                                    )),
                                  )),
                              FadeInUp(
                                  duration: Duration(milliseconds: 1450),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: TextUi.bodyMedBold(
                                      "44",
                                    )),
                                  )),
                              FadeInUp(
                                  duration: Duration(milliseconds: 1460),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                        child: TextUi.bodyMedBold(
                                      "46",
                                      color: white,
                                    )),
                                  )),
                              FadeInUp(
                                  duration: Duration(milliseconds: 1470),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                        child: TextUi.bodyMedBold(
                                      "48",
                                      color: white,
                                    )),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          FadeInUp(
                              duration: Duration(milliseconds: 1500),
                              child: Container(
                                height: buttonHeight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: TextUi.bodyLBold(
                                  'Buy Now',
                                  color: grayScale900,
                                )),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}

bool getHeight(context) {
  final screenheight = MediaQuery.of(context).size.height;
  // final isLargeScreen = screenWidth > 800;
  // final buttonHeight = isLargeScreen ? 100.0 : 50.0;
  // final cardWidth = isLargeScreen ? 250.0 : 150.0;
  // final textsize = isLargeScreen ? 5.0 : 10.0;
  if (screenheight > 800) {
    return true;
  } else {
    return false;
  }
}
