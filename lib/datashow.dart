import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class show extends StatefulWidget {
  int ind;

  Map ll;


  show(this.ind, this.ll);

  @override

  State<show> createState() => _showState();
}

class _showState extends State<show> {
  List colorr = [
    0xFFC85C8E,
    0xFF898AA6,
    0xFFDBA39A,
    0xFFFF9F9F,
    0xFFADDDD0,
    0xFFAEBDCA,
    0xFFC3F8FF,
    0xFFFFF6BF,
    0xFF967E76,
    0xFFFFC090,
    0xFF54BAB9,
    0xFFB270A2,
    0xFFA47E3B,
    0xFFF48484,
    0xFF7286D3,
    0xFFC27664,
    0xFFB7B78A,
    0xFF3A4F7A,
    0xFF7D6E83,
    0xFFF0E161,
    0xFFAFB4FF,
    0xFFAC7088,

  ];
  int pageCount=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //widget.ind.toString();
    //pageCount = int.parse(widget.ll[widget.ind]['color']);
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Hero(
            tag: "bh${widget.ind}",
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 32,
                          color: Color(0xffFFB84C),
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 10, 0, 0),
                      child: Text("Notes",
                          style: TextStyle(
                              color: Color(0xffFFB84C),
                              fontSize: 21,
                              fontWeight: FontWeight.w500)),
                    ),

                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: CustomCard(
                    height: 500,
                    borderRadius: 25,

                    //shadowColor: Color(0xFFD4D4),
                    elevation: 20,
                    //splashColor: Color(0xFFD4D4),

                    color:Color(widget.ll['color']),
                    onTap: () {
                      setState(() {

                      // print("--------------------${widget.ll[widget.ind]['color']}");
                      });
                    },
                    //Color(widget.ll[widget.ind]['color']),
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.fromLTRB(15, 30, 10, 0),
                        child: Text("${widget.ll['TITLE']}", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30)),
                      ),
                      subtitle: Padding(
                        padding:EdgeInsets.fromLTRB(15, 5, 10, 0),
                        child: Text("${widget.ll['NOTES']}", style: TextStyle(color: Colors.black87, fontSize: 23),
                    ),
                      ),
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
