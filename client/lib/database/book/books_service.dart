import 'package:client/database/book/dto/create_book_dto.dart';
import 'package:client/database/book/dto/update_book_dto.dart';
import 'package:client/database/book/models/book_list_api_model.dart';

import 'books_repository.dart';
import 'entities/book.dart';

class BooksService {
  final BooksRepository repository;

  BooksService({required this.repository});

  Future<int> addBook({required CreateBookDTO book}) async {
    Book newBook = Book(
      name: book.name,
      author: book.author,
      publisher: book.publisher,
      isAbleCheckOut: true,
    );
    return await repository.create(newBook);
  }

  Future<List<Book>> getBookList(BookListApiModel bookListApiModel) async {
    return await repository.getBooks(bookListApiModel);
  }

  Future<int> updateBookBorrower({required UpdateBookDTO bookToUpdate}) async {
    final book = await repository.getBook(bookToUpdate.id);
    book.borrower = bookToUpdate.borrower == '' ? null : bookToUpdate.borrower;
    book.isAbleCheckOut = !book.isAbleCheckOut!;

    return await repository.updateBookBorrower(book);
  }

  Future<int> deleteBook(int id) async {
    return await repository.deleteBook(id);
  }
}
