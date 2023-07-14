import 'package:flutter/material.dart';
import 'package:loginj/databasefornote.dart';
import 'package:loginj/sp.dart';

import 'databaseforimage.dart';
import 'heroimage.dart';

class imagee extends StatefulWidget {
  const imagee({Key? key}) : super(key: key);

  @override
  State<imagee> createState() => _imageeState();
}

class _imageeState extends State<imagee> {
  List image = [

    "img_5",
    "img_6",
    "img_7",
    "img_8",

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: image.length,
                itemBuilder: (context, index) {
                  return Hero(
                      tag: "bhh$index",
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      padding: EdgeInsets.fromLTRB(10, 0, 245, 0),
                      color: Colors.black26,
                      child: ListTile(
                        onTap: () {
                          imagedata().insertimage(image[index], hb.data).then((value) {

                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return heroimage(index);
                            },));

                          });
                        },

                        leading: Image(image: AssetImage(   "images/${image[index]}.png"),  fit: BoxFit.fill),


                        trailing: Text("hyyy", style: TextStyle(color: Colors.white)),

                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(onPressed: () {


            }, child: Text("submit", style: TextStyle(color: Colors.blueGrey, fontSize: 30),))
          ],
        ),
      ),
    );
  }
}
