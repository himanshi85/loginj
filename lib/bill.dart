import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  WidgetsToImageController controller = WidgetsToImageController();

  Map<String, List> myList = {
    'Panipri': [false, 20, 0],
    'Pizza': [false, 20, 0],
    'Hot dog': [false, 20, 0],
    'Sandwich': [false, 20, 0],
    'Burger': [false, 20, 0],
    'Pasta': [false, 20, 0]
  };

  List <bool>checkList = [false, false, false, false, false, false];
  List <String>nameList = ['Panipri', 'Pizza', 'Hot dog', 'Sandwich', 'Burger', 'Pasta'];
  List <int>priceList = [20, 200, 80, 120, 50, 150];
  List <String>qtyList = ['0','0','0','0','0','0'];

  List <int> answerList = [0,0,0,0,0,0];

  String s = "male";
  bool checkbox = false;
  int total = 0;
  int totalpanipuri = 0;
  int totalpizza = 0;

  double totalmale = 0;
  double totalfemale = 0;
  double finaltotal = 0;
  String folderpath = "";

  List num = [1, 2, 3, 4];
  List rupp = [20, 200, 60, 120, 80, 150];

  bool co = true;

  DateTime selecteddate = DateTime.now();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("0"), value: "0"),
      DropdownMenuItem(child: Text("1"), value: "1"),
      DropdownMenuItem(child: Text("2"), value: "2"),
      DropdownMenuItem(child: Text("3"), value: "3"),
      DropdownMenuItem(child: Text("4"), value: "4"),
    ];
    return menuItems;
  }

  String selectedValue = "0";
  String selectedValue1 = "0";
  String selectedValue2 = "0";
  String selectedValue3 = "0";
  String selectedValue4 = "0";
  String selectedValue5 = "0";

  bool check = false;
  bool checkb = false;
  bool checkbo = false;
  bool checkboxx = false;
  bool checkboxxx = false;
  bool checkboxxxx = false;

  totall(String s, bool b, int r) {
    // setState(() {
    //   if (b) {
    //     // selectedValue="1";
    //
    //     totalpanipuri = totalpanipuri + (int.parse(selectedValue) * r);
    //   } else {
    //     totalpanipuri = 0;
    //     // if(s=="0")
    //     //   {
    //     //     totalpanipuri = 0;
    //     //
    //     //
    //     //   }
    //     // totalpanipuri = totalpanipuri - r;
    //
    //     // selectedValue="0";
    //   }
    //   //print("$total");
    // });
  }

  // int  totalpi(String s, bool b, int r) {
  //   setState(() {
  //     if (b) {
  //       // selectedValue="1";
  //
  //
  //       totalpizza = totalpizza + (int.parse(s) * r);
  //
  //     } else {
  //       // selectedValue="0";
  //       totalpizza = totalpizza - (int.parse(s) * r);
  //     }
  //     //print("$total");
  //   });
  //   return totalpizza;
  //
  // }
  // totalllll(){
  //
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forpermission();
    createFolder();
  }

  forpermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await [
        Permission.storage,
      ].request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: WidgetsToImage(
          controller: controller,
          child: Container(
            color: Color(0xFFD8D9CF),
            child: Column(children: [
              Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 200, 0),
                  // color: Colors.white,
                  child: Text(
                    "Date:  ${selecteddate.day}/${selecteddate.month}/${selecteddate.year}",
                    style: TextStyle(fontSize: 23, color: Color(0xFF2B4865)),
                  )),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                //margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                      //labelText: "Username",
                      //errorText: satus ? s : null,
                      prefixIcon: Icon(Icons.people_alt_outlined,
                          size: 30, color: Colors.black),
                      suffix: Icon(Icons.arrow_forward),
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(24)),
                      hintText: " User name",
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 3)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 3)),
                      hintStyle:
                          TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                  //autofocus: true,
                  //controller: name,
                  onTap: () {
                    setState(() {
                      //satus=false;
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
                              BorderSide(color: Colors.black54, width: 3)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 3)),
                      hintStyle:
                          TextStyle(color: Color(0xFF2B4865), fontSize: 23)),
                  //autofocus: true,
                  //controller: phonenum,
                  onTap: () {
                    setState(() {
                      //satussss=false;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 0, 10),
                    child: Text("Male",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                  Radio(
                    value: "male",
                    groupValue: s,
                    onChanged: (value) {
                      setState(() {
                        s = value!;
                        print("$s");
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Text("Female",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                  Radio(
                    value: "Female",
                    groupValue: s,
                    onChanged: (value) {
                      setState(() {
                        s = value!;
                      });
                    },
                  )
                ],
              ),
              Container(
                height: 350,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: Checkbox(
                          value: checkList[index],
                          onChanged: (value) {
                            setState(() {
                              if(value!&&(qtyList[index]=='0')) {
                                qtyList[index]='1';
                              } else {
                                qtyList[index]='0';
                              }
                              print("$value");
                              answerList[index] = priceList[index]*int.parse(qtyList[index]);
                              print("=== price = ");
                              calculateTotal(answerList[index],value);
                              checkList[index] = value;
                              //
                              // int tottl = 20 * int.parse(selectedValue);

                              totall(selectedValue, check, 20);
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Image(
                            image: AssetImage("images/img_9-removebg-preview.png"),
                            fit: BoxFit.fill,
                            height: 50,
                            width: 50),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(nameList[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text("${priceList[index]}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Icon(Icons.currency_rupee),
                      Container(
                        //color: Colors.pinkAccent,
                        margin: EdgeInsets.fromLTRB(32, 0, 0, 0),
                        child: DropdownButton(
                          iconDisabledColor: Colors.red,
                          iconEnabledColor: Colors.green,
                          iconSize: 35,
                          dropdownColor: Colors.grey,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          value: qtyList[index],
                          items: dropdownItems,
                          onChanged: (value) {
                            setState(() {


                              qtyList[index] = value!;
                              answerList[index] = priceList[index]*int.parse(qtyList[index]);
                              calculateTotal(answerList[index], true);
                              if (selectedValue != "0") {
                                totall(selectedValue, check, 20);
                              }

                              //print("$selectedValue");
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(8, 20, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2B4865),
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          shape: StadiumBorder()),
                      onPressed: () {
                        setState(() {
                          // total = 0;
                          // totalmale = 0;
                          // totalfemale = 0;
                          // finaltotal = 0;
                          //
                          // print("$total");
                          // print("$s");
                          //
                          // if (s == "male") {
                          //   totalmale = (total * 0.05) as double;
                          //   finaltotal = total - totalmale;
                          // }
                          // if (s == "female") {
                          //   totalfemale = (total * 0.1) as double;
                          //   finaltotal = total - totalfemale;
                          // }
                          // print("$totalmale");
                          // print("$totalfemale");
                          // print("$finaltotal");
                        });
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ))),
              Text("$total",
                  style: TextStyle(color: Colors.black, fontSize: 40)),
              IconButton(
                  onPressed: () {
                    controller.capture().then((value) async {
                      print("--------------------------$value");
                      DateTime dd = DateTime.now();
                      String ss =
                          "image${dd.day}${dd.month}${dd.year}${dd.millisecond}.png";
                      print("*************************  folderpath = $folderpath************");
                      String sss = "${folderpath}/${ss}";
                      print("****************************  sss = $sss************");

                      File file = File(sss);
                      print("++++++++++++++++++++++++++  file = $file");
                      List<int> byte123 = value as List<int>;
                      await file.writeAsBytes(value!);
                      file.create();
                      Share.shareFiles(['${file.path}'], text: 'Great picture');
                    });
                  },
                  icon: Icon(Icons.share))
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> createFolder() async {
    final folderName = "zxcvbnm";
    var path1 = Directory("storage/emulated/0/DCIM/$folderName");

    print(" === path1 = $path1");
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if ((await path1.exists())) {
    } else {
      print(" ===  now folder create ");
      path1.create();
      setState(() {
        folderpath = path1.path;
      });
    }
        print(" === folderpsth in creat = $folderpath");
  }

  void calculateTotal(int price, bool checkList) {
    setState(() {
      total=0;
      for(int i=0; i<answerList.length; i++) {
        total = total+answerList[i];
      }
    });
  }
}
