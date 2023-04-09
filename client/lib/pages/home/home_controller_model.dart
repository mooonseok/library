import 'package:client/design_system/models/book.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeControllerModel {
  late PagingController<int, Book> _pagingController;
  late ScrollController _scrollController;
  late TextEditingController _searchTextEdittingController;

  PagingController<int, Book> get pagingController => _pagingController;
  ScrollController get scrollController => _scrollController;
  TextEditingController get searchTextEdittingController =>
      _searchTextEdittingController;

  void init() {
    _scrollController = ScrollController();
    _pagingController =
        PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);
    _searchTextEdittingController = TextEditingController();
  }
}
