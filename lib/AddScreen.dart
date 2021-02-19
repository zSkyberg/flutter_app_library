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
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
final deneme = TextInputType.text;
@override
  Widget build(BuildContext context) {
String text = "fdfd";
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
        body: Container(
            padding: const EdgeInsets.all(40.0),
            // child: new Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     new TextField(
            //       decoration: new InputDecoration(labelText: "Enter your number"),
            //       keyboardType: TextInputType.number,
            //       inputFormatters: <TextInputFormatter>[
            //         FilteringTextInputFormatter.digitsOnly
            //       ], // Only numbers can be entered
            //     ),
            //     RaisedButton(
            //       onPressed:(){
            //
            //       },
            //       child: Text('Submit'),
            //       elevation: 8,
            //     ),
            //     Text(text),
            //
            //   ],
            // )
        ),
        floatingActionButton: new FloatingActionButton(
          focusColor: Colors.grey,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),

    );
  }

}
