import 'package:humanresources/data/employee_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future <Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'employee.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(EmployeeDao.tableSql);
  }, version: 1,);
}