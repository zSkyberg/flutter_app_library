import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:intl/intl_browser.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

import 'dart:convert';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_hour_glass_header.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';
import 'package:flutter_easyrefresh/taurus_header.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/taurus_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/delivery_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_easyrefresh/src/footer/footer.dart';
// import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
class Dataa {
  Dataa({
    @required this.data,
    @required this.timestamp,
  });

  List<Data> data;
  int timestamp;

  factory Dataa.fromJson(Map<String, dynamic> json) => Dataa(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "timestamp": timestamp,
  };
}

class Data {
  String id;
  String rank;
  String symbol;
  String name;
  String supply;
  String maxSupply;
  String marketCapUsd;
  String volumeUsd24Hr;
  String priceUsd;
  String changePercent24Hr;
  String vwap24Hr;
  String explorer;

  Data(
      {this.id,
        this.rank,
        this.symbol,
        this.name,
        this.supply,
        this.maxSupply,
        this.marketCapUsd,
        this.volumeUsd24Hr,
        this.priceUsd,
        this.changePercent24Hr,
        this.vwap24Hr,
        this.explorer});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id : json['id'],
    rank : json['rank'],
    symbol : json['symbol'],
    name : json['name'],
    supply : json['supply'],
    maxSupply : json['maxSupply'],
    marketCapUsd : json['marketCapUsd'],
    volumeUsd24Hr : json['volumeUsd24Hr'],
    priceUsd : json['priceUsd'],
    changePercent24Hr : json['changePercent24Hr'],
    vwap24Hr : json['vwap24Hr'],
    explorer : json['explorer'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rank'] = this.rank;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['supply'] = this.supply;
    data['maxSupply'] = this.maxSupply;
    data['marketCapUsd'] = this.marketCapUsd;
    data['volumeUsd24Hr'] = this.volumeUsd24Hr;
    data['priceUsd'] = this.priceUsd;
    data['changePercent24Hr'] = this.changePercent24Hr;
    data['vwap24Hr'] = this.vwap24Hr;
    data['explorer'] = this.explorer;
    return data;
  }
}
void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Dataa> futureData;
  static String systemLocale = 'en_US';

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
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   fetchData();
    // });
    return MaterialApp(
      title: 'CryptoCurrency',
      color:Colors.black,
      theme: ThemeData(
        primarySwatch: Colors.blue,
         primaryColor: Colors.black,

      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('CryptoCurrency'),
        ),
        body: Center(
          child: FutureBuilder<Dataa>(
            future: futureData,
            builder: (context, snapshot) {
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
                    return Center(
                        child: RefreshIndicator(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              if(index == 0){
                                return Column(
                                 children:[
                                   Card(
                                      // color: Colors.black87,
                                     child:
                                       Row(
                                         children:[
                                           Expanded(
                                             flex:1,
                                             child: Padding(
                                               padding: EdgeInsets.only(left: 4.0),
                                               child: Text("#",
                                         style: TextStyle(
                                               fontSize: 20,
                                             fontWeight: FontWeight.bold,
                                           color:Colors.black,
                                         ),
                                         ),
                                             ),
                                           ),
                                           Expanded(
                                             flex: 3,
                                             child: Text("Name",
                                               style: TextStyle(
                                                 fontSize: 20,
                                                   fontWeight: FontWeight.bold,
                                                 color:Colors.black,
                                               ),
                                             ),
                                           ),
                                           Expanded(
                                             flex:4,
                                             child: Text("Price/24h",
                                               style: TextStyle(
                                                 fontSize: 20,
                                                   fontWeight: FontWeight.bold,
                                                 color:Colors.black,
                                               ),
                                             ),
                                           ),
                                           Expanded(
                                             flex:2,
                                             child: Text("Volume",
                                               style: TextStyle(
                                                 fontSize: 20,
                                                 fontWeight: FontWeight.bold,
                                                 color:Colors.black,
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                   ),
                                 ]
                                );
                              }
                              index-=1;
                              return Container(
                                decoration: BoxDecoration(
                                  color:Colors.black,
                                  borderRadius: BorderRadius.circular(1)
                                ),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 6.0),
                                        child: Text("${snapshot.data.data[index].rank}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white,
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                           backgroundImage: NetworkImage('https://static.coincap.io/assets/icons/${snapshot.data.data[index].symbol.toLowerCase()}@2x.png'),
                                          backgroundColor: Colors.black,
                                          radius: 17,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 4.0,top: 4.0,bottom:4.0),
                                              child: Text("${snapshot.data.data[index].name}",
                                                style: TextStyle(
                                                fontSize: 15,
                                                  color: Colors.white,
                                                )
                                              ),
                                            ),
                                            Text("${snapshot.data.data[index].symbol}",
                                                style: TextStyle(
                                                fontSize: 15,
                                                  color: Colors.white,
                                                )

                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex:6,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Text( double.parse(snapshot.data.data[index].priceUsd) > 1 ? "\$${snapshot.data.data[index].priceUsd.substring(0,snapshot.data.data[index].priceUsd.indexOf('.')+3).replaceAllMapped(reg, mathFunc)}" : "\$${snapshot.data.data[index].priceUsd.substring(0,snapshot.data.data[index].priceUsd.indexOf('.')+5)}",
                                                      textAlign: TextAlign.right,
                                                      style: TextStyle(
                                                    fontSize: 16,
                                                        color: Colors.white,
                                                  )
                                                  ),
                                                ),
                                            Text( double.parse(snapshot.data.data[index].changePercent24Hr) > 0 ? "+${snapshot.data.data[index].changePercent24Hr.substring(0,snapshot.data.data[index].changePercent24Hr.indexOf('.')+3)}%": "${snapshot.data.data[index].changePercent24Hr.substring(0,snapshot.data.data[index].changePercent24Hr.indexOf('.')+3)}%",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: double.parse(snapshot.data.data[index].changePercent24Hr) > 0 ? Colors.green : Colors.red,
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex:4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child:  Text("\$${NumberFormat.compact().format(double.parse(snapshot.data.data[index].volumeUsd24Hr))}",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color:Colors.white,
                                    indent: 20,
                                    endIndent: 20,
                                    thickness: 0.5,
                                  ),
                                ]),
                              );
                            },
                            itemCount: snapshot.data.data.length,
                          ),
                          onRefresh: _getData,
                        ),

                      );

                  }
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
  //This
  Future<void> _getData() async {
    setState(() {
      fetchData();
      futureData = fetchData();
    });
  }
  void initState() {
    super.initState();
    fetchData();
    futureData = fetchData();
  }
}