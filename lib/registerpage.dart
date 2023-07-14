import 'package:flutter/material.dart';

class re extends StatefulWidget {
  const re({Key? key}) : super(key: key);

  @override
  State<re> createState() => _reState();
}

class _reState extends State<re> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bhhh.jpeg"), fit: BoxFit.fill)),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Container(
              height: 500,
              width: 390,
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),

            ),


          ],

        ),

        ),
      ),
    );
  }
}
