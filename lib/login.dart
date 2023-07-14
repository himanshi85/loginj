import 'package:flutter/material.dart';

class loginn extends StatefulWidget {
  const loginn({Key? key}) : super(key: key);

  @override
  State<loginn> createState() => _loginState();
}

class _loginState extends State<loginn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Image(image: AssetImage("images/img.png"), fit: BoxFit.fill),)
    );
  }
}
