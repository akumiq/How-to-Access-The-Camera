import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  File image;

  Future getImageGallery() async {
    var imageGallery = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      this.image = imageGallery;
    });
  }

  Future getImageCamera() async {
    var imageCamera = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      this.image = imageCamera;
    });
  }

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
              image == null
                  ? new Text("No Image Selected",
                      style: new TextStyle(fontSize: 15))
                  : Image.file(image),
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
          onPressed: getImageGallery,
          child: new Icon(Icons.photo_library),
        ),
        new FloatingActionButton(
          onPressed: getImageCamera,
          child: new Icon(Icons.add_a_photo),
        ),
      ],
    );
  }
}

