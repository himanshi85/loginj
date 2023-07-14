import 'package:flutter/material.dart';
import 'package:loginj/splashscrren.dart';

import 'databaseforcontact.dart';
import 'homepage.dart';

class update extends StatefulWidget {

  Map ll;
  update(Map this.ll);




  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  TextEditingController name=TextEditingController();
  TextEditingController contactnumber=TextEditingController();
  String chagename="";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chagename=widget.ll['CONTACTNAME'];

    name.text = widget.ll['CONTACTNAME'];
    contactnumber.text= widget.ll['CONATACTNUMBER'].toString();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  controller: name,
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
                  controller:contactnumber,
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
                   setState(() {
                     //print("chagename:$chagename");
                     contactdatabase().update(chagename, name.text, contactnumber.text, splashscreen.dbb).then((value){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                         return home();
                       },));
                     });


                   });





                  }, child: Text("Update",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),))
            ],
          ),
        ),
      ),

    );
  }
}
