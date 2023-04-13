import 'package:sqflite/sqflite.dart';

import 'entities/book.dart';

class BooksRepository {
  final Future<Database> database;

  BooksRepository({required this.database});

  Future<int> create(Book book) async => (await database).insert(
        Book.tableName,
        book.toCreateMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

  Future<int> deleteBook(int id) async {
    final db = await database;
    return await db.delete(
      Book.tableName,
      where: '${Book.columnId} = ?',
      whereArgs: [id],
    );
  }

  Future<List<Book>> getBooks(
    int pageSize,
    int pageKey,
    String? keyword,
    bool? unable,
  ) async {
    final db = await database;
    List<dynamic> whereArgs = keyword?.isNotEmpty == true ? ['%$keyword%'] : [];
    String whereClause = keyword?.isNotEmpty == true ? 'name LIKE ? AND ' : '';

    if (unable != null) {
      whereClause += 'isAbleCheckOut = ? AND ';
      whereArgs.add(unable ? 0 : 1);
    }

    final maps = await db.query(
      Book.tableName,
      limit: pageSize,
      offset: pageKey,
      where: whereClause.isNotEmpty
          ? whereClause.substring(0, whereClause.length - 5)
          : null,
      whereArgs: whereArgs,
    );

    return maps.map(Book.toObject).toList();
  }

  Future<int> updateBookBorrower(Book book) async {
    final db = await database;
    return await db.update(
      Book.tableName,
      book.toUpdateMap(),
      where: 'id = ?',
      whereArgs: [book.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Book> getBook(int id) async {
    final db = await database;
    final book = await db.query(
      Book.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return Book.toObject(book.first);
  }
}
