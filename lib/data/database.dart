import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  DatabaseRepository.privateConstructor();

  static final DatabaseRepository instance =
      DatabaseRepository.privateConstructor();

  // final _databaseName = 'sasu';
  // final _databaseVersion = 1;

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
      return _database;
    }
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'test.db');
    return await openDatabase(path, version: 1, onCreate: await onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE contact (
            contactId INTEGER PRIMARY KEY AUTOINCREMENT,
            contactName STRING NOT NULL,
            contactSurname STRING NOT NULL,
            FK_contact_category INT NOT NULL,
            FOREIGN KEY (FK_contact_category) REFERENCES category (categoryId) 
            
          )
          ''');

    await db.execute('''
          CREATE TABLE category (
            categoryId INTEGER PRIMARY KEY AUTOINCREMENT,
            categoryName STRING NOT NULL
          )
          ''');
  }
}
