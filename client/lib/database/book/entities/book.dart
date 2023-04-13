import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class Book {
  static const String tableName = 'books';
  static const int defaultId = 1;

  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnAuthor = 'author';
  static const String columnPublisher = 'publisher';
  static const String columnIsAbleCheckOut = 'isAbleCheckOut';
  static const String columnBorrower = 'borrower';

  static const String createTableSql =
      '''
    CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnAuthor TEXT NOT NULL,
        $columnPublisher TEXT NOT NULL,
        $columnIsAbleCheckOut INTEGER NOT NULL,
        $columnBorrower TEXT
    )
  ''';

  final int id;
  final String name;
  final String author;
  final String publisher;
  bool? isAbleCheckOut;
  String? borrower;
  Book({
    this.id = 1,
    required this.name,
    required this.author,
    required this.publisher,
    this.isAbleCheckOut = true,
    this.borrower,
  });

  Book.toObject(Map<String, dynamic> map)
      : id = map[columnId],
        name = map[columnName],
        author = map[columnAuthor],
        publisher = map[columnPublisher],
        isAbleCheckOut = map[columnIsAbleCheckOut] > 0 ? true : false,
        borrower = map[columnBorrower];

  Map<String, dynamic> toCreateMap() {
    return {
      columnName: name,
      columnAuthor: author,
      columnPublisher: publisher,
      columnIsAbleCheckOut: true,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      columnIsAbleCheckOut: isAbleCheckOut,
      columnBorrower: borrower,
    };
  }
}
