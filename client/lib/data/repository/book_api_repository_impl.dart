import 'package:client/data/data_source/book_api.dart';
import 'package:client/database/book/dto/create_book_dto.dart';
import 'package:client/database/book/dto/update_book_dto.dart';
import 'package:client/database/book/entities/book.dart';
import 'package:client/database/book/models/book_list_api_model.dart';
import 'package:client/domain/repository/book_api_repository.dart';

class BookApiRepositoryImpl implements BookApiRepository {
  final BookApi api;

  BookApiRepositoryImpl(this.api);

  @override
  Future<List<Book>> getBooks({BookListApiModel? bookListApiModel}) async {
    final result = await api.getProject(bookListApiModel);
    return result;
  }

  @override
  Future<int> createBook(CreateBookDTO model) async {
    return await api.registBook(model);
  }

  @override
  Future<int> deleteBook(int id) async {
    return await api.deleteBook(id);
  }

  @override
  Future<int> updateBookBorrower(UpdateBookDTO bookToUpdate) async {
    return await api.updateBookBorrower(bookToUpdate);
  }
}
