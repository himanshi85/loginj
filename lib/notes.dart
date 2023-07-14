import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginj/updatenote.dart';
import 'package:share_plus/share_plus.dart';

import 'dataadd.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'databasefornote.dart';
import 'package:loginj/spalscreen.dart';

import 'datashow.dart';

class notee extends StatefulWidget {


  @override


  State<notee> createState() => _noteeState();
}

class _noteeState extends State<notee> {

  List<Map> ll=[];
  List<Map> searchlist=[];
  bool list = false;
 
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
   bool satusofnull=false;
  



  int id=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      systemStatusBarContrastEnforced: true,systemNavigationBarContrastEnforced: true
    ));
    view();



  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(

          onPressed: () {
            setState(() {
              satusofnull=true;
            });
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {

                return dataadd();
              },
            ));
            // Add your onPressed code here!
          },
          backgroundColor: Colors.transparent,
          foregroundColor:Colors.transparent,

          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,

          child: Container(
            padding: EdgeInsets.all(10),
            child: Image(
                image: AssetImage("images/img_20.png"),
                height: 30,
                width: 30,
                color: Color(0xffFFB84C)),
          ),
        ),
        body:
       Container(
          color: Colors.black87,
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
                      margin: EdgeInsets.fromLTRB(320, 8, 0, 0),
                      height: 35,
                      width: 38,
                      child: Image(
                        image: AssetImage("images/img_19.png"),
                        color: Color(0xffFFB84C),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 15, 300, 0),
                child: Text("Notes",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    )),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 50,
                width: 411.42,
                child: TextField(
                  cursorHeight: 20,
                  cursorColor: Colors.grey.shade800,

                  //textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      print("value:$value");
                      if (value.isNotEmpty) {
                        searchlist = [];

                        for (int i = 0; i < ll.length; i++) {
                          if (ll[i]['TITLE']
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase()) ||
                              ll[i]['NOTES']
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                            list = true;
                            searchlist.add(ll[i]);

                            print("searchlist:::::$searchlist");
                          }
                        }
                      } else {
                        list = false;

                        searchlist = ll;
                      }
                    },);
                  },

                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,
                          size: 28, color: Colors.grey.shade800),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              //fortext=true;

                            });
                          },
                          icon: Icon(Icons.close,
                              size: 28, color: Colors.grey.shade800)),
                      hintText: "Search Contact",
                      fillColor: Colors.white70,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.black26, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26,
                              style: BorderStyle.solid,

                              width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      hintStyle:
                          TextStyle(color: Colors.grey.shade800, fontSize: 23)),
                  //controller: namephone,
                  onTap: () {
                    setState(() {
                      //fortext=false;
                    });
                  },
                  //textInputAction: TextInputAction.next,
                ),
              ),

              ///////////body
              satusofnull?Expanded(
               child: ListView.builder(
                 shrinkWrap: true,

                 itemCount: list?searchlist.length:ll.length,
                 itemBuilder: (context, index) {


                 return  AnimationLimiter(
                   child: AnimationConfiguration.staggeredList(
                     position: index,


                       child: SlideAnimation(
                         delay: Duration(seconds: 1),
                         duration: Duration(seconds: 1),
                          child: Hero(
                           tag: "bh$index",


                           child: Container(
                               width: 390,
                               margin: EdgeInsets.fromLTRB(15, 20, 15, 10),


                               child: CustomCard(
                                 height: 182,
                                 borderRadius: 25,

                                 //shadowColor: Color(0xFFD4D4),
                                 elevation: 20,
                                 //splashColor: Color(0xFFD4D4),

                                 color:Color(ll[index]['color']),
                                 //hoverColor: Color(0xFFEFDAD7),
                                 onTap: () {
                                   setState(() {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                                       return show(index, ll[index]);
                                     },));
                                   });
                                 },
                                 child: Column(
                                   children: [
                                     list?Container(
                                       margin: EdgeInsets.fromLTRB(8, 3, 200, 0),
                                       child: Text("${searchlist[index]['DATE']}", style: TextStyle(color: Colors.black87, fontSize: 20,fontWeight: FontWeight.w500)),

                                     ):Container(
                                       margin: EdgeInsets.fromLTRB(8, 3, 200, 0),
                                       child: Text("${ll[index]['DATE']}", style: TextStyle(color: Colors.black87, fontSize: 20,fontWeight: FontWeight.w500)),

                                     ),
                                     ListTile(

                                       title:
                                       list?Text("${searchlist[index]['TITLE']}",maxLines: 1, style: TextStyle(fontSize: 30, color:Colors.white70)):Text("${ll[index]['TITLE']}",maxLines: 1, style: TextStyle(fontSize: 30, color:Colors.white70)),
                                       subtitle:list?Text("${searchlist[index]['NOTES']}",maxLines: 2, style: TextStyle(fontSize: 20, color:Colors.white54)):Text("${ll[index]['NOTES']}",maxLines: 2, style: TextStyle(fontSize: 20, color:Colors.white54)),

                                     ),
                                     Row(children: [
                                       Container(
                                         margin: EdgeInsets.fromLTRB(50, 8, 13, 0),

                                         child: IconButton(onPressed: () {

                                            setState(() {
                                              id =ll[index]['ID'];


                                              notedata().delete(id, spp.dbbb).then((value){
                                                view();


                                              });
                                            });

                                         }, icon: Icon(Icons.delete, size: 30,color: Colors.black54,)),
                                       ),
                                       Container(
                                         margin: EdgeInsets.fromLTRB(8, 8, 13, 0),

                                         child: IconButton(onPressed: () {

                                             setState(() {
                                               FlutterClipboard.copy("${ll[index]['NOTES']}")
                                                   .then((value) {
                                                 Fluttertoast.showToast(
                                                   msg: "copid",
                                                   toastLength: Toast.LENGTH_SHORT,
                                                   gravity: ToastGravity.BOTTOM_LEFT,
                                                   timeInSecForIosWeb: 5,
                                                   backgroundColor: Colors.pinkAccent,
                                                   textColor: Colors.pink,
                                                   fontSize: 20,
                                                 );
                                               });
                                             });


                                         }, icon: Icon(Icons.copy, size: 30,color: Colors.black54,)),
                                       ),
                                       Container(
                                         margin: EdgeInsets.fromLTRB(8, 8, 13, 0),

                                         child: IconButton(onPressed: () {
                                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                             return updatenote(ll[index]);


                                           },));


                                         }, icon: Icon(Icons.edit, size: 30,color: Colors.black54,)),
                                       ),
                                       Container(
                                         margin: EdgeInsets.fromLTRB(8, 8, 13, 0),

                                         child: IconButton(onPressed: () {
                                           setState(() {
                                             Share.share("${ll[index]['NOTES']}");
                                           });
                                         }, icon: Icon(Icons.share, size: 30,color: Colors.black54,)),
                                       ),


                                     ],)
                                   ],
                                 ),

                               )),
                         ),
                       ),
                     ),
                 );

               },),
             ):Container(
                padding: EdgeInsets.fromLTRB(10, 240, 10, 0),

                child: Text("Note is empty", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void view() {
    notedata().viewall(spp.dbbb).then((value){
      setState(() {
        ll=value;
        searchlist=value;
        if(value.length==0)
          {
            satusofnull=false;
          }
        else
          {
            satusofnull=true;
          }
      });
    });


  }



}
