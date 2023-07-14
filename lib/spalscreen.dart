import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginj/notes.dart';
import 'package:lottie/lottie.dart';
import 'package:sqflite/sqlite_api.dart';

import 'databasefornote.dart';

class spp extends StatefulWidget {
   spp({Key? key}) : super(key: key);
  static Database? dbbb;

  @override
  State<spp> createState() => _sppState();
}

class _sppState extends State<spp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,

    ));
    getdatabase();
    storebool();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              height: 280,
              width: 300,
              child: Lottie.asset("animation/110457-notes-document.json"))),



    );

  }
  Future<void> storebool() async {



    Future.delayed(Duration(seconds: 5)).then((value) {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return notee();
        },));


    });

  }
  void getdatabase( ) {
    notedata mm=notedata();
    mm.databasenote().then((value) {
      setState(() {
      spp.dbbb=value;
      });
    },);

  }
}

