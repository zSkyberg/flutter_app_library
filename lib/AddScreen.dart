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
  Future<Dataa> gelecekData;

  TextEditingController nameController = TextEditingController();
  String fullName = '0.000';
  Future<Dataa> fetchData() async {
    var url = 'https://api.coincap.io/v2/assets';
    final response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> json = jsonDecode(response.body);
      // print(json["data"][0]);
      // final a = json["data"];
      // print("Hello?");
      // print(json["data"]);
      setState(() {
        json = jsonDecode(response.body);
      });
      return Dataa.fromJson(json);
    }
    else {
      // If the server did not return a 200 OK response,// then throw an exception.
      throw Exception('Failed to load album');
    }
  }
@override
  Widget build(BuildContext context) {
  setState(() {
  });
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
        body: Center(
            child: FutureBuilder<Dataa>(
              future: gelecekData,
              builder: (context , snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('none');
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                      return Text('');
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text(
                          '${snapshot.error}',
                          style: TextStyle(color: Colors.red),
                        );
              } else {
                        print("${snapshot.data.data.length}");
                   return Center(
                    child: Column(
                      children: [
                        TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '0.00000',
                        ),
                        onChanged: (text) {
                        setState(() {
                          if(double.parse(text)>=0 ){
                            fullName = text;
                          }
                      else fullName='0.000';
                        //you can access nameController in its scope to get
                        // the value of text entered as shown below
                        //fullName = nameController.text;
                        });
                        },
                        ),
                        Text(fullName),
                        Text('${double.parse(snapshot.data.data[1].priceUsd)*double.parse(fullName)}'),
                      ],
                    ),

                    );
  }
  }
              }
              ),
            ),
      ),
      );
  }
  void initState() {
    super.initState();
    fetchData();
    gelecekData = fetchData();
  }

}
