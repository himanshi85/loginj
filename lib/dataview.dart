import 'package:flutter/material.dart';
import 'package:loginj/database.dart';
import 'package:loginj/loginpage.dart';

class dataview extends StatefulWidget {
  const dataview({Key? key}) : super(key: key);

  @override
  State<dataview> createState() => _dataviewState();
}

class _dataviewState extends State<dataview> {
  List<Map> mm = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder( itemCount: 3,itemBuilder: (context, index) {
        return Container(
          child: Text("$mm"),
        );
      },),
    );
  }
}
