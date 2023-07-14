import 'package:flutter/material.dart';

class lo extends StatefulWidget {
  const lo({Key? key}) : super(key: key);

  @override
  State<lo> createState() => _loState();
}

class _loState extends State<lo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bhhh.jpeg"), fit: BoxFit.fill)),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Text(
            "Welcome Back!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        //Text("Login", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 2),),

        Container(
          height: 550,
          margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
          decoration: BoxDecoration(
              //border: Border(top: BorderSide(color: Colors.white)),
              borderRadius: BorderRadius.circular(50),
              color: Colors.white),
          child: Column(children: [
            Container(
              //padding:EdgeInsets.all(120) ,
              padding: EdgeInsets.fromLTRB(120, 50, 120, 0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "login",
                  style: TextStyle(fontSize: 20),
                )),

            TextButton(
                onPressed: () {},
                child: Text(
                   "Does not have Account?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0081C9),

                    decoration: TextDecoration.underline,
                    //decorationColor: Colors.lightBlue,
                    decorationThickness: 2,


                  ),
                )),
          ]),
        ),
        Card(
            color: Colors.white,
            shadowColor: Colors.lightBlueAccent.shade200,
            elevation: 10,
            borderOnForeground: true,
            semanticContainer: true,
            shape: CircleBorder(
              side: BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2),
            ),
            margin: EdgeInsets.fromLTRB(0, 90, 0, 590),
            child: Container(
              // height: 50,
              // width: 30,
              //
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("images/img_2.png"))),
              //alignment: Alignment.center,
            )),
      ],
    )));
  }
}
