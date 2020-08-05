import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  final barColour = const Color(0xFFE74292);
  final bgColour = const Color(0xFF99AAAB);
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: barColour,
          child: Icon(
            Icons.add_call,
            size: 30,
            color: bgColour,
          ),
          onPressed: () {
            setState(() {
              counter = counter + 1;
              //print('value : $counter');
            });
          },
        ),
        backgroundColor: bgColour,
        appBar: AppBar(
          title: Text('Senthil kumar'),
          backgroundColor: barColour,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add_alert),
                tooltip: 'Show Snackbar',
                onPressed: () {})
          ],
        ),
        body: Center(
          child: Text(
            'Body of this app : $counter',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
