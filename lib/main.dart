// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'dart:convert';
//
// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
//
// String welcomeToJson(Welcome data) => json.encode(data.toJson());
//
// class Welcome {
//   Welcome({
//     this.data,
//     this.timestamp,
//   });
//
//   Data data;
//   int timestamp;
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//     data: Data.fromJson(json["data"]),
//     timestamp: json["timestamp"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data.toJson(),
//     "timestamp": timestamp,
//   };
// }
// void main()=>runApp(new MyApp());
// Future<Data> fetchData() async {
//   var url = 'https://api.coincap.io/v2/assets/bitcoin';
//     final response = await http.get(url);
//     print(response.body);
//   // Map<String, dynamic> json = jsonDecode(response.body);
//   print(response.statusCode);
//   if (response.statusCode == 200) {
//     print(response.body);
//     // If the server did return a 200 OK" response,
//     // then parse the JSON.
//     return Data.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//
//   }
//
// }
// class Data {
//   Data({
//     this.id,
//     this.rank,
//     this.symbol,
//     this.name,
//     this.supply,
//     this.maxSupply,
//     this.marketCapUsd,
//     this.volumeUsd24Hr,
//     this.priceUsd,
//     this.changePercent24Hr,
//     this.vwap24Hr,
//     this.explorer,
//   });
//   String id;
//   String rank;
//   String symbol;
//   String name;
//   String supply;
//   String maxSupply;
//   String marketCapUsd;
//   String volumeUsd24Hr;
//   String priceUsd;
//   String changePercent24Hr;
//   String vwap24Hr;
//   String explorer;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     rank: json["rank"],
//     symbol: json["symbol"],
//     name: json["name"],
//     supply: json["supply"],
//     maxSupply: json["maxSupply"],
//     marketCapUsd: json["marketCapUsd"],
//     volumeUsd24Hr: json["volumeUsd24Hr"],
//     priceUsd: json["priceUsd"],
//     changePercent24Hr: json["changePercent24Hr"],
//     vwap24Hr: json["vwap24Hr"],
//     explorer: json["explorer"],
//   );
//
//   Map<String, dynamic> toJson() =>  {
//     "id": id,
//     "rank": rank,
//     "symbol": symbol,
//     "name": name,
//     "supply": supply,
//     "maxSupply": maxSupply,
//     "marketCapUsd": marketCapUsd,
//     "volumeUsd24Hr": volumeUsd24Hr,
//     "priceUsd": priceUsd,
//     "changePercent24Hr": changePercent24Hr,
//     "vwap24Hr": vwap24Hr,
//     "explorer": explorer,
//   };
// }
//
//
// class deneme {
//   deneme(){
//     print('a');
//   }
//
// }
// class MyApp extends StatefulWidget {
//   @override
//   MyApp({Key key, this.den}) : super(key: key);
//   final Data den;
//
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   Data datalar = Data();
//   deneme quizloader = deneme();
//   Future<Data> futureData;
//
//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchData();
//
//   }
//     // Future<List> LoadQuestions() async {
//     //   var url =
//     //       'https://api.coincap.io/v2/assets/bitcoin';
//     //   var response = await http.get(url);
//     //   Map<String, dynamic> json = jsonDecode(response.body);
//     //
//     //   print(json['name']);
//     //   var btc = json["data"]["id"];
//     //   print(btc);
//     //   return jsonDecode(response.body);
//     // }
//
//
//
//   Widget build(BuildContext context) {
//     // return MaterialApp(
//     //     home: Scaffold(
//     //       appBar: AppBar(
//     //         // title: Text('$datalar[Data][id]'),
//     //       ),
//     //       body:Column(
//     //         children: [
//     //           Container(
//     //             child: Center(
//     //               child:
//     //               Text('${}'
//     //               ),
//     //             )
//     //           ),
//     //           RaisedButton(
//     //             onPressed:()=>{
//     //               LoadQuestions(),
//     //             }
//     //           )
//     //
//     //         ]
//     //       )
//     //
//     //     )
//     // );  Future<String> _calculation = Future<String>.delayed(
//     //     Duration(seconds: 2),
//     //         () => 'Data Loaded',
//     //   );
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Data>(
//             future: futureData,
//             builder: (context, AsyncSnapshot<Data>snapshot) {
//               if (snapshot.hasData) {
//
//                 return Text("${snapshot.data}");
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//
//   }
//
//
// }
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.data,
    this.timestamp,
  });

  Data data;
  int timestamp;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: Data.fromJson(json["data"]),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "timestamp": timestamp,
  };
}

void main()=>runApp(new MyApp());
Future<Data> fetchData() async {
  var url = 'https://api.coincap.io/v2/assets/bitcoin';
  final response = await http.get(url);
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    Map<String, dynamic> json = jsonDecode(response.body);
    print(json['data']['id']);
    return Data.fromJson(json['data']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }

}

class Data {

  Data({
    this.id,
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
    this.explorer,
  });
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    rank: json["rank"],
    symbol: json["symbol"],
    name: json["name"],
    supply: json["supply"],
    maxSupply: json["maxSupply"],
    marketCapUsd: json["marketCapUsd"],
    volumeUsd24Hr: json["volumeUsd24Hr"],
    priceUsd: json["priceUsd"],
    changePercent24Hr: json["changePercent24Hr"],
    vwap24Hr: json["vwap24Hr"],
    explorer: json["explorer"],
  );

  Map<String, dynamic> toJson() =>  {
    "id": id,
    "rank": rank,
    "symbol": symbol,
    "name": name,
    "supply": supply,
    "maxSupply": maxSupply,
    "marketCapUsd": marketCapUsd,
    "volumeUsd24Hr": volumeUsd24Hr,
    "priceUsd": priceUsd,
    "changePercent24Hr": changePercent24Hr,
    "vwap24Hr": vwap24Hr,
    "explorer": explorer,
  };
}


class MyApp extends StatefulWidget {
  @override
  MyApp({Key key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Data datalar = Data();
  Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }
  // Future<List> LoadQuestions() async {
  //   var url =
  //       'https://api.coincap.io/v2/assets/bitcoin';
  //   var response = await http.get(url);
  //   Map<String, dynamic> json = jsonDecode(response.body);
  //
  //   print(json['name']);
  //   var btc = json["data"]["id"];
  //   print(btc);
  //   return jsonDecode(response.body);
  // }

  Widget build(BuildContext context) {
    // return MaterialApp(
    //     home: Scaffold(
    //       appBar: AppBar(
    //         // title: Text('$datalar[Data][id]'),
    //       ),
    //       body:Column(
    //         children: [
    //           Container(
    //             child: Center(
    //               child:
    //               Text('${}'
    //               ),
    //             )
    //           ),
    //           RaisedButton(
    //             onPressed:()=>{
    //               LoadQuestions(),
    //             }
    //           )
    //
    //         ]
    //       )
    //
    //     )
    // );
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Data>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("sadsada");
                print(futureData);
                return Text("${snapshot.data.name}")
                ;
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );

  }


}