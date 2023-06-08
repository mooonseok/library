import 'package:client/database/book/dto/create_book_dto.dart';
import 'package:client/database/book/dto/update_book_dto.dart';
import 'package:client/database/book/entities/book.dart';
import 'package:client/database/book/models/book_list_api_model.dart';

abstract class BookApiRepository {
  Future<List<Book>> getBooks({BookListApiModel bookListApiModel});

  Future<int> createBook(CreateBookDTO body);

  Future<int> deleteBook(int id);

  Future<int> updateBookBorrower(UpdateBookDTO bookToUpdate);
}
