
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../models/Data_models.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelper {

  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String emptable = 'emptable';
  String colId = 'id';
  String colname = 'name';
  String colAdress = 'adress';
  String colAge = 'age';
  String coldesig = 'designation';
  String colmarks = 'mark_percentage';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() =>
      _databaseHelper ??= DatabaseHelper._createInstance();


  Future<Database> get database async =>
      _database ??= await initializeDatabase();


  Future<Database> initializeDatabase() async
  {
    Directory.current = await getApplicationDocumentsDirectory();

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'employee.db';
    var db = await openDatabase(path, version: 1, onCreate: createDb);
    return db;
  }

  void createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $emptable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colname TEXT,$colAdress TEXT, $colAge INTEGER, $colmarks FLOAT,$coldesig TEXT)');
  }

  // Insert Operation: Insert a Employee object to database
  Future<int> insertUser(Employee emp) async {
    Database? db = await this.database;
    var result = await db.insert(emptable, emp.toMap());
    if (result != 0) {
      debugPrint("SUCCESS INSERT");
    } else {
      debugPrint("FAILUERE INSERT");
    }
    return result;
  }


  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getEmployeeMapList() async {
    Database db = await this.database;

    //var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(emptable, orderBy: '$colId ASC');
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateUser(Employee note) async {
    var db = await this.database;
    var result = await db.update(emptable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int?> deleteUser(int? id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $emptable WHERE $colId = $id');
    return result;
  }


  //get users

// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Employee>> getEmployeeList() async {
    var employeeMapList = await getEmployeeMapList(); // Get 'Map List' from database
    int count = employeeMapList
        .length; // Count the number of map entries in db table

    List<Employee> empList = <Employee>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      empList.add(Employee.fromMapObject(employeeMapList[i]));
      debugPrint(" get username -->${empList[i].name}");
    }

    return empList;
  }
}

