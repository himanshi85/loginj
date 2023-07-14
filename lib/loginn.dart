import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';
import 'logindb.dart';

class hp extends StatefulWidget {

  hp({Key? key}) : super(key: key);
  static Database? db;

  @override
  State<hp> createState() => _hpState();
}

class _hpState extends State<hp> {
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginpage();
  }
  Widget build(BuildContext context) {

    return Scaffold(
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
            margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
            //margin: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(

                  prefixIcon: Icon(Icons.lock,
                      size: 30, color: Colors.black),
                  suffix: Icon(Icons.arrow_forward),

                  hintText: "password",
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.white, width: 3)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.white, width: 3)),
                  hintStyle:
                  TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
              //autofocus: true,
              controller: password,

            ),
          ),
           ElevatedButton(onPressed: () {
            setState(() {
              mydatabase().view(name.text, password.text, hp.db).then((value){
                print("................$value");
                if(value.length==2){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login sucessfully'),
                    ),
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('user not found'),
                    ),
                  );
                }
              });




            });

          }, child: Text("Signup")),
           ElevatedButton(onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return logi();

              },));




            });

          }, child: Text("login"))
        ],
      ),
    );
  }
  void loginpage( ) {
    mydatabase mm=mydatabase();
    mm.databasemydata().then((value) {
      setState(() {
        hp.db=value;
      });
    },);

  }
}
