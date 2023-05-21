abstract class InfiniteScrollFunctionInterface<T> {
  final Future<List<dynamic>> Function({
    required int pageKey,
    required int pageSize,
    bool? isAbleToCheckOut,
    String? keyword,
  })? getData;

  InfiniteScrollFunctionInterface({this.getData});
}
