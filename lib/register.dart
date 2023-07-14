import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:loginj/loginpage.dart';
import 'package:loginj/splashscrren.dart';

import 'database.dart';
import 'databaseforcontact.dart';

class ree extends StatefulWidget {
  const ree({Key? key}) : super(key: key);

  @override
  State<ree> createState() => _reeState();
}

class _reeState extends State<ree> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phonenum = TextEditingController();
  String s = "";
  String ss = "";
  String sss = "";
  String ssss = "";
  int i = 1;


  bool satus = false;
  bool satuss = false;
  bool satusss = false;
  bool satussss = false;

  get yourCallbackFunction => null;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle().copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent));
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                    5, MediaQuery
                    .of(context)
                    .padding
                    .top, 0, 0),
                child: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 40,
                    )),
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 50, 0, 0),
                child: Text(
                    "Create\n"
                        "Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35)),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                //margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                    //labelText: "Username",
                      errorText: satus ? s : null,
                      prefixIcon: Icon(Icons.people_alt_outlined,
                          size: 30, color: Colors.black),
                      suffix: Icon(Icons.arrow_forward),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(24)),
                      hintText: " User name",
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
                    setState(() {
                      satus = false;
                    });
                  },
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
                      errorText: satuss ? ss : null,
                      prefixIcon: Icon(Icons.email_sharp,
                          size: 30, color: Colors.black),
                      suffix: Icon(Icons.arrow_forward),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(24)),
                      hintText: "Email",
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
                  controller: email,
                  onTap: () {
                    setState(() {
                      satuss = false;
                    });
                  },
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 0, 30, 10),


                child: TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                      errorText: satusss ? sss : null,
                      prefixIcon: Icon(
                          Icons.lock, size: 30, color: Colors.black),
                      suffix: Icon(Icons.arrow_forward),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(24)),
                      hintText: "Password",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, width: 3)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, width: 3)),
                      hintStyle:
                      TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                  textInputAction: TextInputAction.next,
                  //autofocus: true,
                  controller: password,
                  onTap: () {
                    setState(() {
                      i = 2;
                    });
                  },
                ),
              ),
              (i == 1) ? SizedBox(height: 0,) : Container(
                height: 110,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 0, 30, 10),

                //margin: EdgeInsets.only(left: 20,right: 20),
                child: FlutterPwValidator(
                  controller: password,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  width: 400,
                  height: 50,
                  onSuccess: () {
                    setState(() {
                      i = 1;
                    });
                    print("object");
                  },
                ),
              ),

              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                //margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(

                      errorText: satussss ? ssss : null,
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
                  controller: phonenum,
                  onTap: () {
                    setState(() {
                      satussss = false;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(35, 0, 10, 0),
                      child: Icon(Icons.calendar_month_outlined,
                          color: Colors.black, size: 35)),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 200, 0),
                    child: TextButton(
                        onPressed: () async {
                          final DateTime? picked = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime.now()))!;
                          if (picked != null && picked != selecteddate) {
                            setState(() {
                              selecteddate = picked;
                            });
                          }
                        },
                        child: Text(
                          "${selecteddate.day}/${selecteddate
                              .month}/${selecteddate.year}",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                ],
              ),
              InkWell(
                onTap: () {

                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(8, 20, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2B4865),
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          shape: StadiumBorder()),
                      onPressed: () {


                        setState(() {
                          satus = false;
                          satuss = false;
                          satusss=false;
                          satussss = false;

                          RegExp nameRegExp = RegExp(
                            // r'^[a-z A-Z]+$'
                              r'^[a-zA-Z]([._-]?[a-zA-Z0-9]+)*$');
                          RegExp nameRegExpp =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          RegExp nameRegEx = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                          RegExp emailreg = RegExp(
                             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


                          RegExp nameRegExppp = RegExp(
                            // r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$'
                              r'(^(?:[+0]9)?[0-9]{10}$)');

                          if (name.text.isEmpty) {
                            satus = true;
                            s = "please enter the name";
                          } else if (!nameRegExp.hasMatch(name.text)) {
                            satus = true;
                            s = "please enter the valid name";
                          }

                          if (email.text.isEmpty) {
                            satuss = true;
                            ss = "please enter the email";
                          } else if (!emailreg.hasMatch(email.text)) {
                            satuss = true;
                            ss = "please enter the valid email";
                          }
                          if(password.text.isEmpty){
                            satusss=true;
                            sss="Please enter the Password";
                          }
                          if (phonenum.text.isEmpty) {
                            satussss = true;
                            ssss = "please enter the phone number ";
                          } else if (!nameRegExppp.hasMatch(phonenum.text)) {
                            satussss = true;
                            ssss = "please enter the valid phone number";
                          }

                          contactdatabase().vieww(name.text, password.text, splashscreen.dbb, phonenum.text).then((value){
                            if(value.length==0  &&  satus == false &&
                                satussss == false &&
                                satusss == false &&
                                satuss == false ){
                              contactdatabase().insert(name.text, email.text,
                                  splashscreen.dbb, password.text, phonenum.text);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return loo();

                              },));

                            }
                            else
                            if(value.length!=0  &&  satus == false &&
                                satussss == false &&
                                satusss == false &&
                                satuss == false ){


                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User already exits'),
                                ),
                              );
                              name.text="";
                              phonenum.text="";
                              email.text="";
                              password.text="";

                            }


                          });

                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  DateTime selecteddate = DateTime.now();
}
