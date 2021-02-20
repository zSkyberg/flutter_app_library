import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:intl/intl_browser.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:flutter_app_library/AddScreen.dart';
import 'package:flutter_app_library/main.dart';
void gotoMainPage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => MyApp()),
  );
}




class AddScreen extends StatefulWidget {
  AddScreen({Key key}) : super(key: key);
  @override
  _AddScreenState createState() => _AddScreenState();

}

class _AddScreenState extends State<AddScreen> {
  TextEditingController myController = TextEditingController();


  TextEditingController nameController = TextEditingController();
  String fullName = '';
@override
  Widget build(BuildContext context) {
String textt = "ds";
      return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          actionsIconTheme: IconThemeData(
              size: 30.0,
              color: Colors.white,
              opacity: 10.0
          ),
          title: Text(
            "Wallet",
        ),
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,
            color: Colors.white,
            ),
            onPressed: () {
             gotoMainPage(context);
            },
          ),
      ),
        body: Center(child: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
                onChanged: (text) {
                  setState(() {
                    fullName = text;
                    //you can access nameController in its scope to get
                    // the value of text entered as shown below
                    //fullName = nameController.text;
                  });
                },
              )),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(fullName),
          )
        ]))
      ),
    );
  }

}
