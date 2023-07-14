import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loginj/profilepage.dart';
import 'package:loginj/splashscrren.dart';
import 'package:loginj/update.dart';
import 'package:sqflite/sqflite.dart';

import 'contact.dart';
import 'database.dart';
import 'databaseforcontact.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String username = "";
  String name = "";
  int mobilenum = 0;
  String image = "";
  int id = 0;
  bool satus = false;
  List<Map> ll = [];
  List<Map> searchlist = [];
  bool data = false;

  int count = 0;
  String updatename = "";
  int updatecontact = 0;
  bool list = false;
  bool fortext=true;
  TextEditingController namephone=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forusername();

    mapload();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return contact();
              },
            ));
            // Add your onPressed code here!
          },
          backgroundColor: Color(0xFF2B4865),
          child:
              Image(image: AssetImage("images/download-removebg-preview.png")),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF2B4865),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return profile();
                    },
                  ));
                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Image.asset(
                  width: 50,
                  "images/img_12.png",
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.blueGrey[200],
        body: Column(
          children: [

            fortext?
            Container(
             color: Color(0xFF2B4865),
              height: 40,
              width: 411,
              //margin: EdgeInsets.fromLTRB(10, 0, , 0),
              padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text("Contacts", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, )),
            ):SizedBox(),
            Container(
              height: 70,
              width: 411,
              color: Color(0xFF2B4865),
              child:
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 15),

                child: TextField(
                  cursorHeight: 30,
                  cursorColor: Colors.grey,
                  //textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      print("value:$value");
                      if (value.isNotEmpty) {
                        searchlist = [];

                        for (int i = 0; i < ll.length; i++) {
                          if (ll[i]['CONTACTNAME']
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              ll[i]['CONATACTNUMBER']
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
                    });
                  },
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.search, size: 33, color: Colors.grey),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          fortext=true;

                        });
                      }, icon:Icon(Icons.close, size: 33, color: Colors.grey)),
                      hintText: "Search Contact",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,

                              width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      hintStyle:
                          TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                  controller: namephone,
                  onTap: () {
                    setState(() {
                      fortext=false;
                    });
                  },
                  //textInputAction: TextInputAction.next,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: list ? searchlist.length : ll.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(20)),
                        // child: Text("${ll[index]['CONTACTNAME']}\n""+${ll[index]['CONATACTNUMBER']}",style: TextStyle(color: Color(0xFF2B4865), fontSize: 20,fontWeight: FontWeight.bold, )),
                        child: ListTile(
                          title: list
                              ? Text(
                                  "${searchlist[index]['CONTACTNAME']}",
                                  style: TextStyle(
                                    color: Color(0xFF2B4865),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  "${ll[index]['CONTACTNAME']}",
                                  style: TextStyle(
                                    color: Color(0xFF2B4865),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          subtitle: list
                              ? Text(
                                  " +${searchlist[index]['CONATACTNUMBER']}",
                                  style: TextStyle(
                                    color: Color(0xFF2B4865),
                                    fontSize: 18,
                                  ),
                                )
                              : Text(
                                  " +${ll[index]['CONATACTNUMBER']}",
                                  style: TextStyle(
                                    color: Color(0xFF2B4865),
                                    fontSize: 18,
                                  ),
                                ),
                          trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == 2) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return update(ll[index]);
                                  },
                                ));
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                    value: 1,
                                    onTap: () {
                                      name = ll[index]['CONTACTNAME'];
                                      contactdatabase()
                                          .delete(name, splashscreen.dbb)
                                          .then((value) {
                                        mapload();
                                      });
                                    },
                                    child: Text("delete")),
                                PopupMenuItem(
                                    onTap: () {
                                      setState(() {
                                        updatename = ll[index]['CONTACTNAME'];
                                        updatecontact =
                                            ll[index]['CONATACTNUMBER'];
                                      });
                                    },
                                    value: 2,
                                    child: Text("Update")),
                                PopupMenuItem(child: Text("Share")),
                              ];
                            },
                          ),
                        ));
                  }),
            ),
          ],
        ),
        drawer: Drawer(
          width: 280,
          backgroundColor: Colors.blueGrey[500],
          child: Column(
            children: [
              Container(
                color: Color(0xFFE1EEDD),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("images/img_11.png"),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        "$username",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Color(0xFF2B4865),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 20),
                      child: Text("+$mobilenum",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF2B4865))),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 33,
                  ),
                  
                  
                  
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  tileColor: Colors.transparent,
                  selectedColor: Colors.transparent,
                  textColor: Colors.transparent,
                  

                  trailing: Container(
                    
                    margin: EdgeInsets.fromLTRB(0, 5, 130, 0),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 22, ),
                        )),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 33,
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 80, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Notification",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.people_alt_outlined,
                  color: Colors.white,
                  size: 33,
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 120, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Profile",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 33,
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 110, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Settings",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 33,
                ),
                trailing: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 110, 0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Log out",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void forusername() {
    setState(() {
      username = splashscreen.prefer!.getString("username") ?? "him";
      mobilenum = splashscreen.prefer!.getInt("mobilenumber") ?? 0;
      image = splashscreen.prefer!.getString("image") ?? "image";
      id = splashscreen.prefer!.getInt("id") ?? 0;

    });
  }

  void mapload() {

    contactdatabase().viewall(splashscreen.dbb, id).then((value) {
      setState(() {
        ll = value;
        searchlist = value;
      });

    });
  }
}
