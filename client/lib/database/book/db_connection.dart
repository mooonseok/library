import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'entities/book.dart';

class DBConnection {
  DBConnection._();

  static final Future<Database> _instance = _connect();

  static Future<Database> getInstance() {
    return _instance;
  }

  static Future<Database> _connect() async {
    String path = join(await getDatabasesPath(), 'book_database.db');

    Database connection = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );

    return connection;
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(Book.createTableSql);
  }
}
