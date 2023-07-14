import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class image extends StatefulWidget {
  const image({Key? key}) : super(key: key);

  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String ss="";
  //late final bytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 520,
            width: 520,
            //color: Colors.grey,
            child: CircleAvatar(
              maxRadius: 60,
              backgroundImage: FileImage(File(ss)),),
          ),
          IconButton(
              onPressed: () async {
              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
              setState(()  {

                ss=image!.path;

            });
          }, icon:Icon(Icons.camera_alt_outlined))


                ],
      ),
    );
  }
}
