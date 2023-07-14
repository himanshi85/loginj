import 'package:flutter/material.dart';
import 'package:loginj/imagestore.dart';
import 'package:lottie/lottie.dart';
import 'package:sqflite/sqflite.dart';

import 'databaseforimage.dart';
import 'databasefornote.dart';
import 'imagepicker.dart';

class hb extends StatefulWidget {

  static Database? data;

  @override
  State<hb> createState() => _hbState();
}

class _hbState extends State<hb> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    storebool();
    getdatabase();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset("animation/97930-loading.json"),
    );

  }
  Future<void> storebool() async {



    Future.delayed(Duration(seconds: 5)).then((value) {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return imagee();
      },));


    });

  }
  void getdatabase( ) {
    imagedata mm=imagedata();
    mm.databaseimage().then((value) {
      setState(() {
        hb.data=value;
      });
    },);

  }
}
