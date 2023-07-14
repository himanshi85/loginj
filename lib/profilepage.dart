import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginj/splashscrren.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  XFile? photo;

  String sss = "";
  bool satus=false;
  String username="";
  String imagee="";

  String email="";
  int mobilenum=0;
  bool imagesatus=true;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forusername();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  satus=true;
                });
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(120, 80, 120, 0),
                  height: 160,
                  width: 160,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: FileImage(File(imagee)),
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text("$username",style: TextStyle(color: Colors.white, fontSize: 30,fontFamily: "f1")),),
           Container(child: Text("____________________________________________",style: TextStyle(color: Colors.white)),),
           satus?
           Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(150, 10, 15, 0),
                  child: IconButton(
                      onPressed: () async {
                        final XFile? photo =
                            await _picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          sss = photo!.path;
                          splashscreen.prefer!.setString("image", sss);
                          imagesatus=true;
                          satus=false;
                        });
                      },
                      icon: Icon(
                        Icons.photo_camera,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 70, 0),
                  child: IconButton(
                      onPressed: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          sss = image!.path;
                          splashscreen.prefer!.setString("image", sss);
                          imagesatus=true;
                          satus=false;

                        });
                      },
                      icon: Icon(
                        Icons.photo_camera_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ],
            ):Row(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              height: 60,
              width: 350,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child:
              Row(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),

                  child: Icon(
                    Icons.phone,
                    color: Color(0xFF6096B4),
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text("$mobilenum", style: TextStyle(color: Color(0xFF6096B4), fontWeight: FontWeight.bold, fontSize: 20)),
                )
              ]),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              height: 60,
              width: 350,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child:
              Row(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),

                  child: Icon(
                    Icons.email,
                    color: Color(0xFF6096B4),
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text("$email", style: TextStyle(color: Color(0xFF6096B4), fontWeight: FontWeight.bold, fontSize: 20)),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
  void forusername() {
    setState(() {
      username=splashscreen.prefer!.getString("username")??"him";
      email=splashscreen.prefer!.getString("email")??"phimanshi";

      mobilenum=splashscreen.prefer!.getInt("mobilenumber")??0;
      imagee=splashscreen.prefer!.getString("image")??"him";




    });

  }
}
