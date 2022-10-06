import 'package:databaseexample/tasks.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
class Dphelper{

static final Dphelper instance =Dphelper.internal();

factory Dphelper()
{
  return instance;
}

Dphelper.internal(){}



createDatabase()



async {

WidgetsFlutterBinding.ensureInitialized();

String path = join(await getDatabasesPath(),'course.db');

Database db= await openDatabase(path, version: 1, onCreate: (Database Db,int v) {

  Db.execute(' CREATE TABLE tasks (id INTEGER PRIMARY KEY, task TEXT, date INTEGER)');

});
return db;


}

Future <int> CreateTasks (Tasks task) async{


  Database DP= await createDatabase();

 return DP.insert('tasks', task.toMap());


}

Future<List> alltasks()
async {
  Database DP= await createDatabase();

 return DP.query('tasks');
}


   




}