import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:intl/intl.dart';
import 'package:loginj/spalscreen.dart';

import 'databasefornote.dart';
import 'notes.dart';

class dataadd extends StatefulWidget {
  const dataadd({Key? key}) : super(key: key);

  @override
  State<dataadd> createState() => _dataaddState();
}

class _dataaddState extends State<dataadd> {
  DateTime selecteddate = DateTime.now();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();

  String formattedate = DateFormat('d MMMM yyyy').format(DateTime.now());
  String forview = DateFormat.yMMMEd().format(DateTime.now());

  String formattedat = DateFormat.j().format(DateTime.now());
  String s = "";
  String ss = "";
  bool satus = false;
  bool satuss = false;
  List color = [
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
  int indexx = 0;
  bool clrstatus = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black38,
        body: Column(
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
                Container(
                    margin: EdgeInsets.fromLTRB(145, 8, 0, 0),
                    height: 35,
                    width: 38,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                child: GridView.builder(
                                  itemCount: color.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 8),
                                  itemBuilder: (context, index) {
                                    if (index == 7) {
                                      return IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close));
                                    }
                                    return CustomCard(
                                      onTap: () {
                                        setState(() {
                                          clrstatus = true;
                                          indexx = index;
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Container(
                                        color: Color(color[index]),
                                        margin: EdgeInsets.all(5),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Color(0xffFFB84C),
                        ))),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 3, 0, 0),
                    height: 37,
                    width: 37,
                    child: Image(
                      image: AssetImage("images/img_18.png"),
                      color: Color(0xffFFB84C),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 8, 5, 0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          satus = false;
                          satuss = false;
                          if (title.text.isEmpty) {
                            satus = true;
                            s = "enter title";
                          }

                          if (note.text.isEmpty) {
                            satuss = true;
                            ss = "enter notes";
                          }

                          if (satus == false && satuss == false) {
                            notedata()
                                .insert(formattedate, title.text, note.text,
                                    spp.dbbb, Color(color[indexx]).value)
                                .then((value) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return notee();
                                },
                              ));
                            });
                          }
                        });
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                          color: Color(0xffFFB84C),
                          fontSize: 21,
                        ),
                      )),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB(50, 15, 80, 0),
                // color: Colors.white,
                child: Text(
                  "${formattedate} at $formattedat",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: TextField(
                style: TextStyle(fontSize: 33, color: Colors.white),
                decoration: InputDecoration(
                    errorText: satus ? s : null,
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 0)

                    //hintText: "Insert your message",

                    ),
                scrollPadding: EdgeInsets.all(10.0),
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                autofocus: true,
                cursorColor: Colors.white,
                cursorHeight: 40,
                textInputAction: TextInputAction.next,
                controller: title,
                onTap: () {
                  setState(() {
                    satus = false;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextField(
                style: TextStyle(fontSize: 23, color: Colors.white),

                decoration: InputDecoration(
                    errorText: satuss ? ss : null,
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.pinkAccent, fontSize: 0)
                    //hintText: "Insert your message",
                    ),
                scrollPadding: EdgeInsets.all(10.0),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: true,
                cursorColor: Colors.white,
                cursorHeight: 30,
                controller: note,
                //textInputAction: TextInputAction.next,
                onTap: () {
                  setState(() {
                    satuss = false;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
