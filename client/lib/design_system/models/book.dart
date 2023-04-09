import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  factory Book({
    required int id,
    required String name,
    required String author,
    required String publisher,
    required bool isAbleCheckOut,
    String? borrower,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
