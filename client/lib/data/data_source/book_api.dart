import 'package:client/database/book/books_module.dart';
import 'package:client/database/book/dto/create_book_dto.dart';
import 'package:client/database/book/dto/update_book_dto.dart';
import 'package:client/database/book/entities/book.dart';
import 'package:client/database/book/models/book_list_api_model.dart';

class BookApi {
  BooksModule module;
  BookApi(this.module);

  Future<List<Book>> getProject(BookListApiModel? bookListApiModel) async {
    try {
      final response = await BooksModule.service.getBookList(bookListApiModel!);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> registBook(CreateBookDTO model) async {
    try {
      final response = await BooksModule.service.addBook(book: model);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> deleteBook(int id) async {
    try {
      final response = await BooksModule.service.deleteBook(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> updateBookBorrower(UpdateBookDTO bookToUpdate) async {
    try {
      return await BooksModule.service
          .updateBookBorrower(bookToUpdate: bookToUpdate);
    } catch (e) {
      rethrow;
    }
  }
}
