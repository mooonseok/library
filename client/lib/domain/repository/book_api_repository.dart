import 'package:client/design_system/models/book.dart';
import 'package:client/design_system/models/result.dart';

abstract class BookApiRepository {
  Future<Result<List<Book>>> getBooks({
    int? pageSize,
    int? pageKey,
  });
}
