import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_view/Employee.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbEmployeeManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "Employees.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE employee(id INTEGER PRIMARY KEY autoincrement, name TEXT, dept TEXT, Address TEXT)",

        );
      } );
    }
  }

  Future<int> insertEmployee(Employee employee) async {
    await openDb();
    return await _database.insert('employee', employee.toMap());
  }

  Future<List<Employee>> getEmployeeList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('employee');
    return List.generate(maps.length, (i) {
      return Employee(
          id: maps[i]['id'], name: maps[i]['name'], dept: maps[i]['dept'],Address: maps[i]['Address']);
    });
  }

  Future<int> updateEmployee(Employee employee) async {
    await openDb();
    return await _database.update('employee', employee.toMap(),
        where: "id = ?", whereArgs: [employee.id]);
  }

  Future<void> deleteEmployee(int id) async {
    await openDb();
    await _database.delete(
        'employee',
        where: "id = ?", whereArgs: [id]
    );
  }
}

class Employee {
  int id;
  String name;
  String dept;
  String Address;

  Employee({@required this.name, @required this.dept, @required this.Address, this.id});

  Map<String, dynamic> toMap() {
    return {'name': name, 'dept': dept, 'Address':Address};
  }
}