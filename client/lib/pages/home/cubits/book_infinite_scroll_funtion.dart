import 'package:client/database/book/entities/book.dart';
import 'package:client/design_system/interfaces/infinite_scroll_function_interface.dart';

class BookInfiniteScrollFunction extends InfiniteScrollFunctionInterface<Book> {
  BookInfiniteScrollFunction({super.getData});
}
