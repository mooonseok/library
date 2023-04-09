import 'dart:convert';
import 'dart:io';

import 'package:client/design_system/models/book.dart';
import 'package:client/design_system/models/result.dart';
import 'package:client/utility/common_methods/common_method.dart';
import 'package:client/utility/constants/const_paths.dart';
import 'package:http/http.dart' as http;

class BookApi {
  final http.Client client;

  BookApi(this.client);

  Future<Result<List<dynamic>>> getProject({
    int? pageKey,
    int? pageSize,
  }) async {
    Uri uri = Uri.http(ConstPaths.baseUrl,
        CommonMethod.format.urlPath(version: 1, mainPath: 'books'), {
      'pageKey': pageKey.toString(),
      'pageSize': pageSize.toString(),
    });
    try {
      // final response = await client.get(uri);
      return Result.byResponse(
          http.Response(json.encode(_bookList), HttpStatus.ok));
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}

List<Book> _bookList = [
  Book(
    id: 1,
    name: '책 1',
    author: '박문석',
    publisher: '랩이오사',
    isAbleCheckOut: true,
  ),
];
