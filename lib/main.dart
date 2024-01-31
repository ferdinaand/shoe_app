import 'dart:ui';

import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoe_app/Shoes.dart';
import 'package:shoe_app/global_widgets/text.ui.dart';
import 'package:shoe_app/resources/res.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

final List<String> shoeImages = [];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 800;
    final cardHeight = isLargeScreen ? 800.0 : 250.0;
    final cardWidth = isLargeScreen ? 250.0 : 150.0;
    final textsize = isLargeScreen ? 5.0 : 10.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        backgroundColor: Colors.white.withAlpha(200),
        leading: null,
        title: Center(
          child: TextUi.headingBold4(
            "Haven Deluxe",
            color: grayScale900,
          ),
        ),
        // brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    categoryOptions(),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: makeItem(
                            pricesize: isLargeScreen ? 60 : 30,
                            itemBrandNameSize: isLargeScreen ? 40 : 20,
                            itemNameSize: isLargeScreen ? 60 : 30,
                            height: cardHeight,
                            image: 'assets/images/one.jpg',
                            tag: 'red',
                            context: context)),
                    FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: makeItem(
                            pricesize: isLargeScreen ? 60 : 30,
                            itemBrandNameSize: isLargeScreen ? 40 : 20,
                            itemNameSize: isLargeScreen ? 60 : 30,
                            height: cardHeight,
                            image: 'assets/images/two.jpg',
                            tag: 'blue',
                            context: context)),
                    FadeInUp(
                        duration: Duration(milliseconds: 1700),
                        child: makeItem(
                            pricesize: isLargeScreen ? 60 : 30,
                            itemBrandNameSize: isLargeScreen ? 40 : 20,
                            itemNameSize: isLargeScreen ? 60 : 30,
                            height: cardHeight,
                            image: 'assets/images/three.jpg',
                            tag: 'white',
                            context: context)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: isLargeScreen ? 100 : 50,
                decoration: BoxDecoration(color: Colors.black),
                child: Center(
                  child: TextUi.bodyMed(
                    'Copyright 2023 @Haven Deluxe',
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem(
      {image,
      tag,
      height,
      pricesize,
      itemNameSize,
      itemBrandNameSize,
      context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Shoes(
                        image: image,
                        tag: tag,
                      )));
        },
        child: Container(
          height: height,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1000),
                            child: Text(
                              "Sneakers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: itemNameSize,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1100),
                            child: Text(
                              "Nike",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: itemBrandNameSize),
                            )),
                      ],
                    ),
                  ),
                  FadeInUp(
                      duration: Duration(milliseconds: 1200),
                      child: Container(
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
                      ))
                ],
              ),
              FadeInUp(
                  duration: Duration(milliseconds: 1200),
                  child: Text(
                    "100\$",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: pricesize,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class categoryOptions extends StatelessWidget {
  const categoryOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2.2 / 1,
            child: FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: TextUi.bodyNorm(
                      color: grayScale900,
                      "All",
                      // fontSize: 20,
                    ),
                  ),
                )),
          ),
          AspectRatio(
            aspectRatio: 2.2 / 1,
            child: FadeInUp(
                duration: Duration(milliseconds: 1100),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Center(
                    child: TextUi.bodyNorm(
                      color: grayScale900,
                      "Sneakers",
                      // style: TextStyle(fontSize: 17),
                    ),
                  ),
                )),
          ),
          AspectRatio(
            aspectRatio: 2.2 / 1,
            child: FadeInUp(
                duration: Duration(milliseconds: 1200),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Center(
                    child: TextUi.bodyNorm(
                      color: grayScale900,
                      "Football",
                      // style: TextStyle(fontSize: 17),
                    ),
                  ),
                )),
          ),
          AspectRatio(
            aspectRatio: 2.2 / 1,
            child: FadeInUp(
                duration: Duration(milliseconds: 1300),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Center(
                    child: TextUi.bodyNorm(
                      color: grayScale900,
                      "Soccer",
                      // style: TextStyle(fontSize: 17),
                    ),
                  ),
                )),
          ),
          AspectRatio(
            aspectRatio: 2.2 / 1,
            child: FadeInUp(
                duration: Duration(milliseconds: 1400),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Center(
                    child: TextUi.bodyNorm(
                      color: grayScale900,
                      "Golf",
                      // style: TextStyle(fontSize: 17),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
