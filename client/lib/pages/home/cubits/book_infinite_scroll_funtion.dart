import 'package:client/design_system/interfaces/infinite_scroll_function_interface.dart';
import 'package:client/design_system/models/book.dart';
import 'package:client/pages/home/widgets/book_list_row_molecule.dart';
import 'package:flutter/material.dart';

class BookInfiniteScrollFunction extends InfiniteScrollFunctionInterface<Book> {
  BookInfiniteScrollFunction({super.getData});
  @override
  Widget contentBuilder(Book data) {
    return BookListRowMolecule(book: data, onTap: () {});
  }
}
