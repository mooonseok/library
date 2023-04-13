import 'books_repository.dart';
import 'books_service.dart';
import 'db_connection.dart';

class BooksModule {
  static final BooksRepository _repository =
      BooksRepository(database: DBConnection.getInstance());

  static final BooksService service = BooksService(repository: _repository);
}
