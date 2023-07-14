import 'package:flutter/material.dart';
import 'package:loginj/homepage.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'databaseforcontact.dart';
import 'loginpage.dart';

class splashscreen extends StatefulWidget {
  splashscreen({Key? key}) : super(key: key);
  static SharedPreferences? prefer;
  static Database? dbb;




  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
bool satus=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storebool();
    getdatabase();
  }
  Widget build(BuildContext context) {
    return Scaffold(

body: Center(
    child: Container(
        height: 280,
        width: 300,
        child: Lottie.asset("animation/98306-contacts-book.json"))),
    );
  }

  Future<void> storebool() async {
    splashscreen.prefer = await SharedPreferences.getInstance();
    setState(() {
      satus=splashscreen.prefer!.getBool("satus")??false;

    });

    Future.delayed(Duration(seconds: 5)).then((value) {
       if(satus){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
           return home();
         },));
       }
       else{
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
           return loo();
         },));
       }
    });

  }
void getdatabase( ) {
  contactdatabase mm=contactdatabase();
  mm.contactdatase().then((value) {
    setState(() {
      splashscreen.dbb=value;
    });
  },);

}
}
