import 'package:client/data/data_source/book_api.dart';
import 'package:client/design_system/models/book.dart';
import 'package:client/design_system/models/result.dart';
import 'package:client/domain/repository/book_api_repository.dart';

class BookApiRepositoryImpl implements BookApiRepository {
  final BookApi api;

  BookApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Book>>> getBooks({
    int? pageSize,
    int? pageKey,
  }) async {
    final result = await api.getProject(
      pageKey: pageKey,
      pageSize: pageSize,
    );
    return result.when(success: (data) {
      return Result.success(data.map((value) => Book.fromJson(value)).toList());
    }, error: (message, statusCode) {
      return Result.error(message, statusCode: statusCode);
    });
  }
}
