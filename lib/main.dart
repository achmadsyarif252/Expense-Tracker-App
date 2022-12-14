import 'dart:math';

import 'package:expenses_tracker_app/models/latihan.dart';
import 'package:expenses_tracker_app/widgets/list_latihan.dart';
import 'package:flutter/material.dart';

import 'widgets/input_latihan.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'OpenSans',
      ),
      title: 'Expenses Tracker',
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Latihan> _studyFlutterHours = [
    Latihan(
        id: DateTime.now().toString(),
        title: 'Bank App',
        jam: 40,
        waktu: DateTime.now(),
        warna: Colors.blue),
    Latihan(
        id: DateTime.now().toString(),
        title: 'Fintech App',
        jam: 70,
        waktu: DateTime.now(),
        warna: Colors.pink),
  ];

  void addStudyHours(String title, int jam, DateTime date) {
    Random nomer = new Random();
    final newStudy = Latihan(
      id: DateTime.now().toString(),
      title: title,
      jam: jam,
      waktu: date,
      warna: Color((nomer.nextDouble() * 0xFFFFFF).toInt()),
    );
    setState(() {
      _studyFlutterHours.add(newStudy);
    });
  }

  void _startAddNewHours(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return InputLatihan(addStudyHours);
      },
    );
  }

  void deleteItem(String id){
    setState(() {
      _studyFlutterHours.removeWhere((latihan) => latihan.id==id);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() MyAppState');
    final mediaQuery = MediaQuery.of(context);
    final appbar = AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Flutter W Hours',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      leading: Icon(
        Icons.account_balance_wallet_rounded,
        color: Colors.black,
      ),
      centerTitle: true,
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: appbar,
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height-
                appbar.preferredSize.height -
                mediaQuery.padding.top)*1.0,
            child: ListLatihan(_studyFlutterHours,deleteItem),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewHours(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
