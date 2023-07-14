import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class mydatabase{

    Future<Database> databasemydata() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demoodata.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE mytable (id INTEGER PRIMARY KEY autoincrement, NAME TEXT,EMAIL text,PASSWORD text, CONATACTNUMBER int)');


        });
     return database;
  }



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
