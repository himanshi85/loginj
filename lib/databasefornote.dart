import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class notedata{
  Future<Database> databasenote() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demoodata.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE mytable (ID INTEGER PRIMARY KEY autoincrement,DATE text, TITLE TEXT,NOTES text, color int)');

          await db.execute(
              'CREATE TABLE imagetable (Id INTEGER PRIMARY KEY autoincrement,Image text)');

        });
    return database;
  }
  Future insert(date, title, note, db, color) async {

    String s='insert into mytable (DATE,TITLE,NOTES, color) values ("$date","$title","$note", "$color")';
    int aa = await db.rawInsert(s);
    print("_____________$aa");


  }
  Future<List<Map>> viewall(db) async {
    String s1='SELECT * FROM mytable';

    List<Map> mmmm= await db.rawQuery(s1);
    print("----------------$mmmm");
    return mmmm;
  }

  Future delete(id, db) async {
    String del='DELETE FROM mytable WHERE ID = "$id"';
    int aaa=await db.rawDelete(del);
    print("$aaa");
  }
  Future<List<Map>> vieww(title, notes, db, ) async {
    String ss='Select * from mytable where TITLE="$title" or NOTES="$notes" ';

    List<Map> mmm= await db.rawQuery(ss);
    print("----------------$mmm");
    return mmm;
  }
  Future update(title,notes, id ,db) async {


    String sss='UPDATE mytable SET TITLE = "$title", NOTES = "$notes" WHERE ID = "$id"';
    int aaa=await db.rawUpdate(sss);


  }
////////////image
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