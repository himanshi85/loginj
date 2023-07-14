

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginj/register.dart';
import 'package:sqflite/sqflite.dart';
import 'package:loginj/splashscrren.dart';

import 'database.dart';
import 'databaseforcontact.dart';
import 'dataview.dart';
import 'homepage.dart';

class loo extends StatefulWidget {
  const loo({Key? key}) : super(key: key);


  @override
  State<loo> createState() => _looState();

}

class _looState extends State<loo> {

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();
  bool invisible = true;

  String s = "";
  String ss = "";
  String username="";
  String email="";
  int mobilenum=0;
  int id=0;






  bool satus = false;
  bool satuss = false;
  void inContact(TapDownDetails details) {
    setState(() {
      invisible = false;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      invisible=true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    height = height-keyboardHeight;
    print("=========$keyboardHeight");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle().copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent));
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bbb.png"), fit: BoxFit.fill)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: height*0.06,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(
                  5, MediaQuery.of(context).padding.top, 0, 0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: height*0.05,
                  )),
            ),
            Container(
              height: 75,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, height*0.06, 0, 0),
              child: Text("Welcome\nBack!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35)),
            ),
            SizedBox(height:150),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
              //margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    errorText: satus ? s : null,
                    //labelText: "Username",
                    prefixIcon: Icon(Icons.people_alt_outlined,size: 30,color: Colors.black),
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
                    hintStyle: TextStyle(color: Color(0xFF2B4865),fontSize: 23)),
                textInputAction: TextInputAction.next,
                //autofocus: true,
                controller: name,
                onTap: () {
                  setState(() {
                    satus=false;
                  });
                },
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              //margin: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                obscureText: invisible,
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    errorText: satus ? ss : null,
                  //labelText: "Username",
                    prefixIcon: Icon(Icons.lock,size: 30,color: Colors.black),
                    suffix:

                    invisible?
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                      child: IconButton(onPressed: () {
                        setState(() {
                          invisible=false;

                        });
                      }, icon: Icon(Icons.visibility_off,
                      )),
                    ): Container(
                      margin: EdgeInsets.fromLTRB(0, 35, 0, 0),

                      child: IconButton(onPressed: () {
                        setState(() {
                          invisible=true;

                        });
                      }, icon: Icon(Icons.visibility,
                      )),
                    ),
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(24)),
                    hintText: "password",
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 3)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 3)),
                    hintStyle: TextStyle(color: Color(0xFF2B4865),fontSize: 23)
                ),
                //textInputAction: TextInputAction.next,
                //autofocus: true,
                controller: password,
                onTap: () {
                  setState(() {
                    satuss=false;
                  });
                },
              ),
            ),
            Container(
           margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextButton(onPressed: () {

              }, child: Text("Forget Password?", style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold)), ),
            ),


            Container(
              
              margin: EdgeInsets.fromLTRB(8, 0, 10, 0),
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF2B4865),padding: EdgeInsets.fromLTRB(15, 5, 15, 5), shape: StadiumBorder()),
                  
                  onPressed: () {
                    setState(() {
                      satus = false;
                      satuss = false;


                      if (name.text.isEmpty) {
                        satus = true;
                        s = "please enter the name";
                      }

                      if (password.text.isEmpty) {
                        satuss = true;
                        ss = "please enter the password";
                      }
                    });

                    contactdatabase().view(name.text, password.text, splashscreen.dbb).then((value){
                        print("value$value");

                        if(value.length==1&&satus == false&&
                            satuss == false){

                          splashscreen.prefer!.setBool("satus", true);
                          username=value[0]['NAME'];
                          email=value[0]['EMAIL'];
                          mobilenum=value[0]['CONATACTNUMBER'];
                          id=value[0]['id'];


                          print("username=$username");
                          splashscreen.prefer!.setString("username", username);

                          splashscreen.prefer!.setString("email", email);
                          splashscreen.prefer!.setInt("mobilenumber", mobilenum);
                          splashscreen.prefer!.setInt("id", id);






                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Login sucessfully'),
                            ),
                          );
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return home();
                          },));
                        }
                        else if(value.length!=1&&  satus == false&&
                        satuss == false){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('user not found'),
                            ),
                          );
                        }
                      });














                  }, child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, ),)),
            ),
            Container(
               margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text("Does not have Account?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 120),
              child: TextButton(onPressed: () {
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return ree();
                  },));
                }
                );


              }, child: Text("Sign up", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF2B4865), decoration: TextDecoration.underline,),)),
            ),

          ],
        ),
      ),
    );
  }

}
