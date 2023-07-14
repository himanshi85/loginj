import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class mulimage extends StatefulWidget {
  const mulimage({Key? key}) : super(key: key);

  @override
  State<mulimage> createState() => _mulimageState();
}

class _mulimageState extends State<mulimage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> mm = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
            children: [
          ElevatedButton(
            onPressed: () async {
              var imagepicked = await _picker.pickMultiImage();
              if (imagepicked != "") {
                if (imagepicked != null) {
                  setState(() {
                    mm = imagepicked;
                  });
                }
              }

          }, child: Icon(Icons.camera)),

          mm != null ? Wrap(



  children:mm.map((e) {
                return CircleAvatar(
                  maxRadius: 80,
                  backgroundImage: FileImage(File(e.path)),
                );
              }).toList(),


          ) : Container(),
        ]),
      ),
    );
  }
}
