import 'package:flutter/material.dart';

import 'databaseforcontact.dart';
import 'package:loginj/splashscrren.dart';
import 'homepage.dart';



class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  TextEditingController namee = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  int id=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forusername();
  }
  Widget build(BuildContext context) {
    return
      Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bbb.png"), fit: BoxFit.fill)),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 350, 30, 20),
                //margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(

                      prefixIcon: Icon(Icons.people_alt_outlined,
                          size: 30, color: Colors.black),
                      suffix: Icon(Icons.arrow_forward),

                      hintText: "Name",
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 3)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 3)),
                      hintStyle:
                      TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                  textInputAction: TextInputAction.next,
                  //autofocus: true,
                  controller: namee,
                  onTap: () {

                  },
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
                //margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(

                      //errorText: satussss ? ssss : null,
                      //labelText: "Username",
                      prefixIcon:
                      Icon(Icons.phone, size: 30, color: Colors.black),
                      suffix: Icon(Icons.arrow_forward),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(24)),
                      hintText: "Contact number",
                      focusedBorder: UnderlineInputBorder(

                          borderSide:
                          BorderSide(color: Colors.white, width: 3)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 3)),
                      hintStyle:
                      TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                  textInputAction: TextInputAction.next,
                  //autofocus: true,
                  controller: phonenumber,
                  onTap: () {

                  },
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2B4865),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      shape: StadiumBorder()),
                  onPressed: () {


                        contactdatabase().insertdata(namee.text, phonenumber.text, id, splashscreen.dbb);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return home();
                        },));


              }, child: Text("Save",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),))
            ],
          ),
        ),
      ),

    );
  }
  void forusername() {
    setState(() {

      id=splashscreen.prefer!.getInt("id")??0;
       // print("$id");
      });






  }
}
