# flutter_app_library

A new Flutter application.

## Getting Started

https://docs.google.com/document/d/1jLh5om7bXWsqzV1UU9Lusg3QfaWejImkLRPmds_BeIY/edit?usp=sharing

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:
Software Report

<!--Software Introduction-->

<!--Programmer’s Name-Lastname: Berat Gökberk Çalışkan-->

<!--Development Environment-->

<!--Programming Languages: Dart, Flutter-->
<!--Name of the Program: Cryptocrrency-->
<!--Operating System: Mobile Devices-->
<!--Requirements:-->
<!--Software Design-->
<!--1-) Identification of the Software/ Purpose of the Software-->
<!--	The purpose of this software is to follow top 100 cryptocurrencies including their rank, name, current price, price change percent in the last 24 hours, and the volume in the last 24 hours. Users will be able to observe all of these through the list in descending order depending on the rank.-->

<!--2-) Solution of the Problem and Solution Design-->
<!--	Since the cryptocurrency stock market is nothing like any other stock markets. Coins or tokens could double or even quadruple their values in a very short time. It is important to keep track of them easily and by observing differences easily on the screen. To keep track of the latest prices and volumes, the software needs real time values. To do that, we need to draw the data from an api.-->


<!--	2.1-) User Interface-->

<!--	 Program pulls the data from “https://api.coincap.io/v2/assets”, it comes in json format. I pull the data with Future<Data> and and display it in FutureBuilder<Data> with which builder contains context and snapshot. With ListView.builder, I pull each data such as name , price inside this ListView. Datas come with lots of zeros and numbers after the comma, I shortened the numbers by using substring() class, I used NumberFormat class which comes flutter, to shorten the volume. Because volumes can be really huge numbers which causes bad looks.-->
<!--color: double.parse(snapshot.data.data[index].changePercent24Hr) > 0 ? Colors.green : Colors.red,-->
<!--This code is to display a 24h change depending on the value.-->
<!--when the number is minus it comes with -, but not with +. So ;-->
<!--Text( double.parse(snapshot.data.data[index].changePercent24Hr) > 0 ? "+${snapshot.data.data[index].changePercent24Hr.substring(0,snapshot.data.data[index].changePercent24Hr.indexOf('.')+3)}%": "${snapshot.data.data[index].changePercent24Hr.substring(0,snapshot.data.data[index].changePercent24Hr.indexOf('.')+3)}%",-->
<!--And just like that other enhancements such as if the price is smaller than 1, display in #.#### format, İf larger, display in ###.## format. Also, to ease the reading, comma comes after every three digits.-->

<!--3-) Test of the Results-->
<!--	outputs with lots of digits-->
<!-- all black screen-->
<!--searching for how to format number to K(1000 = 1k)-->
<!--aligning the texts-->
<!--implementing the header inside the future builder-->
<!--4-) Warnings and Deficiencies-->
<!--	There could be some kind of wallet system, users can submit how much they have of each coin or token, the system outputs total currency and volume change of it.-->

<!--5-) Servability of the program to the purpose of the program-->
<!--	The program works very efficiently and you can see real time values of each coin. UI is designed in a way that users will have no trouble understanding it.-->

<!--6-) Results, Comments and Suggestions-->
<!--	The program works fine and anyone can start using it at any time. I am also currently working on a “refresh on pull” feature.  After that to make the app more specialized there can be some advancements on input the amount of coin the user has.-->


- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
