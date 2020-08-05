import 'package:flutter/material.dart';

import 'common/adcarousel.dart';
import 'common/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final borderColor = const Color(0xFF18acad);
List<String> images = new List();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    images.add(
        'http://www.welcomenepal.com/uploads/Lumbini5_tk_buddhajayanti.jpg');
    images.add('http://www.welcomenepal.com/uploads/lumbini8.jpg');
    images.add('http://www.welcomenepal.com/uploads/lumbini3.jpg');
    images.add(
        'http://www.welcomenepal.com/uploads/lumbini4_tk_buddhajayanti.jpg');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Online Shopping',
        ),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          Center(
              child: Text(
            'Shopping home page!',
            style: TextStyle(color: borderColor, fontSize: 18.0),
            textAlign: TextAlign.center,
          )),
          SizedBox(width: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 200,
            child: AdCarousel(imageUrls: images),
          )
        ],
        //child: Text('Shopping home page!'),
      ),
    );
  }
}
