import 'package:client/database/book/dto/create_book_dto.dart';
import 'package:client/database/book/dto/update_book_dto.dart';
import 'package:client/database/book/entities/book.dart';

abstract class BookApiRepository {
  Future<List<Book>> getBooks({
    int? pageSize,
    int? pageKey,
    bool? unable,
    String? keyword,
  });

  Future<int> createBook(CreateBookDTO body);

  Future<int> deleteBook(int id);

  Future<int> updateBookBorrower(UpdateBookDTO bookToUpdate);
}
