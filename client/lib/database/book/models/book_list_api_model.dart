class BookListApiModel {
  final int pageKey;
  final int pageSize;
  final bool? isAbleToCheckOut;
  final String? keyword;

  BookListApiModel({
    required this.pageKey,
    required this.pageSize,
    this.isAbleToCheckOut = true,
    this.keyword = '',
  });
}
