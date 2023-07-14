import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class imagedata {
  Future<Database> databaseimage() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'image.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table

          await db.execute(
              'CREATE TABLE imagetable (Id INTEGER PRIMARY KEY autoincrement,Image text)');
        });
    return database;
  }


  Future insertimage(image, db) async {

    String s='insert into imagetable (image) values ("$image")';
    int aa = await db.rawInsert(s);
    print("_____________$aa");


  }
  Future<List<Map>> viewwimage(db) async {
    String ss='Select * from imagetable';

    List<Map> mmm= await db.rawQuery(ss);
    print("----------------$mmm");
    return mmm;
  }

}