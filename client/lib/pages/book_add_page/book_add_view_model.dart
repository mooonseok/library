import 'package:client/domain/repository/book_api_repository.dart';
import 'package:client/pages/book_add_page/book_add_controllers.dart';

class BookAddViewModel {
  final BookApiRepository bookApiRepository;

  late BookAddControllers _bookAddControllers;

  BookAddControllers get bookAddControllers => _bookAddControllers;

  void init() {
    _bookAddControllers = BookAddControllers();
    _bookAddControllers.init();
  }

  BookAddViewModel(this.bookApiRepository);
}
