import 'dart:async';
import 'dart:convert';
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
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(
            "Wallet",
        ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
             gotoMainPage(context);
            },
          ),
      ),
      ),
    );
  }
}
