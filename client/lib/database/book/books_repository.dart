import 'package:client/database/book/models/book_list_api_model.dart';
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
    BookListApiModel bookListApiModel,
  ) async {
    final db = await database;
    List<dynamic> whereArgs = bookListApiModel.keyword?.isNotEmpty == true
        ? ['%${bookListApiModel.keyword}%']
        : [];
    String whereClause =
        bookListApiModel.keyword?.isNotEmpty == true ? 'name LIKE ? AND ' : '';

    if (bookListApiModel.isAbleToCheckOut != null) {
      whereClause += 'isAbleCheckOut = ? AND ';
      whereArgs.add(bookListApiModel.isAbleToCheckOut! ? 0 : 1);
    }

    final maps = await db.query(
      Book.tableName,
      limit: bookListApiModel.pageSize,
      offset: bookListApiModel.pageKey,
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
