import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class contactdatabase{

  Future<Database> contactdatase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'contact.db');

    // open the database
    Database databasee = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table

          await db.execute(
              'CREATE TABLE contactdata (ID INTEGER PRIMARY KEY autoincrement, CONTACTNAME TEXT, CONATACTNUMBER int, USERID int)');
          await db.execute(
              'CREATE TABLE mytable (id INTEGER PRIMARY KEY autoincrement, NAME TEXT,EMAIL text,PASSWORD text, CONATACTNUMBER int)');
        });
    return databasee;
  }
  insertdata(namee, contactnum,userid,  db) async {

    String s='insert into contactdata (CONTACTNAME , CONATACTNUMBER, USERID) values ("$namee" , "$contactnum", "$userid")';
    int aa = await db.rawInsert(s);
    print("_____________$aa");
  }


  Future<List<Map>> viewall(db, userid) async {
    String s1='SELECT * FROM contactdata where USERID="$userid"';
    print(">>>>>>>>>>>>>");
    List<Map> mmmm= await db.rawQuery(s1);
    print("----------------$mmmm");
    return mmmm;
  }


  Future update(name,updatename, updatenumber ,db) async {


     String sss='UPDATE contactdata SET CONTACTNAME = "$updatename", CONATACTNUMBER = "$updatenumber" WHERE CONTACTNAME = "$name"';
     int aaa=await db.rawUpdate(sss);


  }
  Future delete(username, db) async {
    String del='DELETE FROM contactdata WHERE CONTACTNAME = "$username"';
    int aaa=await db.rawDelete(del);
    print("$aaa");
  }
  Future<List<Map>> viewname(db, name) async {





    String s1='SELECT * FROM contactdata where CONTACTNAME="$name"';
    print(">>>>>>>>>>>>>");
    List<Map> mmmm= await db.rawQuery(s1);
    print("----------------$mmmm");
    return mmmm;
  }
  //////////query for 1st table
  insert(namee, email, db, password, contactnum) async {

    String s='insert into mytable (NAME , EMAIL,PASSWORD, CONATACTNUMBER) values ("$namee" , "$email","$password" , "$contactnum")';
    int aa = await db.rawInsert(s);
    print("_____________$aa");
  }
  Future<List<Map>> view(lname, lpass, db) async {
    String ss='Select * from mytable where NAME="$lname" and PASSWORD="$lpass" ';

    List<Map> mm= await db.rawQuery(ss);
    print("----------------$mm");
    return mm;
  }
  Future<List<Map>> vieww(lname, lpass, db, lcontactnum) async {
    String ss='Select * from mytable where NAME="$lname" or PASSWORD="$lpass" or CONATACTNUMBER="$lcontactnum" ';

    List<Map> mmm= await db.rawQuery(ss);
    print("----------------$mmm");
    return mmm;
  }
  Future<List<Map>> viewwdata(db) async {
    String ss='Select * from mytable ';

    List<Map> mmmm= await db.rawQuery(ss);
    print("----------------$mmmm");
    return mmmm;
  }





}
