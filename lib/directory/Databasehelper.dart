import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Databasehelper

{

  Database? db;

  Future<Database> create_db() async
  {
    if(db!=null)
      {
        return db!;
      }
    else
      {
        var dir = await getApplicationDocumentsDirectory();
        var path = join(dir.path,"todo_app.db");
        var db = await openDatabase(path,version: 1,onCreate: todo_table);
        return db!;
      }
  }

  todo_table(Database db,int version) async
  {
    db.execute("create table todo (titleid integer primary key autoincrement,titlename text,content text )");
  }


  Future<int> insertable(title,content) async
  {
   var db = await create_db();
   var id =await db.rawInsert("insert into todo (titlename,content) values(?,?)", [title,content]);
   return id;
  }

  Future<List> getalldata() async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from todo");
    return data.toList();

  }

  Future<int> deletedata(id) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from todo where titleid=?",[id]);
    return status;
  }

  Future<List> getsingledata(id) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from todo where titleid=?",[id]);
    return data.toList();

  }
  Future<int> updatedata(title, content, id) async
  {
    var db = await create_db();
    var status = await db.rawUpdate("update todo set titlename = ?, content = ? where titleid = ?", [title, content, id]);
    return status;
  }


}