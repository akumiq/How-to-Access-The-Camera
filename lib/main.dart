import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo Camera',
        home: new MyHomePage(),
        theme: new ThemeData(primarySwatch: Colors.blueGrey));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Demo Camera")),
      body: new SingleChildScrollView(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("No Image Selected", style: new TextStyle(fontSize: 15)),
              new Padding(
                padding: const EdgeInsets.only(top: 20),
                child: actionButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButton() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.photo_library),
        ),
        new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add_a_photo),
        ),
      ],
    );
  }
}

