import 'package:flutter/material.dart';

import 'databaseforimage.dart';
import 'package:loginj/sp.dart';

class heroimage extends StatefulWidget {
  int ind;
  heroimage( [this.ind=0]);
  



  @override
  State<heroimage> createState() => _heroimageState();
}

class _heroimageState extends State<heroimage> {
  String image="";
  List<Map> ll=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageget();

  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: Hero(tag:" bhh${widget.ind}", child: Container(
          margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
          height: 500,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/${ll[widget.ind]['Image']}.png"), fit: BoxFit.fill)),
        )),
      ),
    );
  }
  void imageget() {
    imagedata().viewwimage(hb.data).then((value) {
      setState(() {
        ll=value;


      });
    });

  }


}
