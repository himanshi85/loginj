import 'package:flutter/material.dart';
import 'package:loginj/database.dart';
import 'package:loginj/log.dart';
import 'package:loginj/login.dart';
import 'package:sqflite/sqflite.dart';
import 'package:loginj/loginn.dart';



class logi extends StatefulWidget {
  const logi({Key? key}) : super(key: key);

  @override
  State<logi> createState() => _logiState();
}

class _logiState extends State<logi> {

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(50, 0, 30, 20),
              //margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(

                    prefixIcon: Icon(Icons.people_alt_outlined,size: 30,color: Colors.black),
                    suffix: Icon(Icons.arrow_forward),

                    hintText: " User name",
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 3)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 3)),
                    hintStyle: TextStyle(color: Color(0xFF2B4865),fontSize: 23)),
                textInputAction: TextInputAction.next,
                //autofocus: true,
                controller: name,

              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(50, 0, 30, 20),
              //margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(

                    prefixIcon: Icon(Icons.lock,size: 30,color: Colors.black),
                    suffix: Icon(Icons.arrow_forward),

                    hintText: "password",
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 3)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 3)),
                    hintStyle: TextStyle(color: Color(0xFF2B4865),fontSize: 23)),
                textInputAction: TextInputAction.next,
                //autofocus: true,
                controller: password,

              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
              //margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(

                    prefixIcon: Icon(Icons.email_sharp,
                        size: 30, color: Colors.black),
                    suffix: Icon(Icons.arrow_forward),

                    hintText: "Email",
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 3)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 3)),
                    hintStyle:
                    TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                //autofocus: true,
                controller: email,

              ),
            ),

          ],
        ),
      ),
    );
  }


}
