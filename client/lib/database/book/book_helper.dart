// import 'package:client/design_system/models/book.dart';
// import 'package:sqflite/sqflite.dart';

// class BookHelper {
//   static const _databaseName = 'book_database.db';
//   static const _databaseVersion = 1;

//   static const _tableName = 'books';

//   static const _columnId = 'id';
//   static const _columnTitle = 'title';
//   static const _columnAuthor = 'author';
//   static const _columnPublisher = 'publisher';
//   static const _columnIsAbleCheckOut = 'isAbleCheckOut';
//   static const _columnBorrower = 'borrower';

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }

//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final databasePath = await getDatabasesPath();
//     final path = '$databasePath/$_databaseName';

//     return await openDatabase(
//       path,
//       version: _databaseVersion,
//       onCreate: _onCreate,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE $_tableName (
//         $_columnId INTEGER PRIMARY KEY,
//         $_columnTitle TEXT NOT NULL,
//         $_columnAuthor TEXT NOT NULL
//         $_columnPublisher TEXT NOT NULL
//         $_columnIsAbleCheckOut INTEGER NOT NULL
//         $_columnBorrower TEXT
//       )
//     ''');
//   }

//   Future<List<Book>> getBooks(int limit, int offset) async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(
//       _tableName,
//       limit: limit,
//       offset: offset,
//     );
//     return List.generate(maps.length, (i) {
//       return Book.fromJson(maps[i]);
//     });
//   }

//   Future<int> getBookCount() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(_tableName);
//     return maps.length;
//   }

//   Future<void> insertBook(Book book) async {
//     final db = await database;
//     await db.insert(
//       _tableName,
//       book.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<void> updateBook(Book book) async {
//     final db = await database;
//     await db.update(
//       _tableName,
//       book.toJson(),
//       where: '$_columnId = ?',
//       whereArgs: [book.id],
//     );
//   }

//   Future<void> deleteBook(int id) async {
//     final db = await database;
//     await db.delete(
//       _tableName,
//       where: '$_columnId = ?',
//       whereArgs: [id],
//     );
//   }
// }
