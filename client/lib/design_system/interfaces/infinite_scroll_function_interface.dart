import 'package:flutter/material.dart';

abstract class InfiniteScrollFunctionInterface<T> {
  final Future<List<dynamic>> Function({
    required int pageKey,
    required int pageSize,
  })? getData;

  InfiniteScrollFunctionInterface({this.getData});

  Widget contentBuilder(T data);
}
