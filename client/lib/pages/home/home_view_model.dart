import 'package:client/design_system/models/book.dart';
import 'package:client/design_system/models/result.dart';
import 'package:client/domain/repository/book_api_repository.dart';
import 'package:client/pages/home/cubits/book_infinite_scroll_cubit.dart';
import 'package:client/pages/home/cubits/book_infinite_scroll_funtion.dart';
import 'package:client/pages/home/cubits/book_infinite_scroll_method.dart';
import 'package:client/pages/home/home_controller_model.dart';

class HomeViewModel {
  final BookApiRepository bookApiRepository;

  late HomeControllerModel _homeControllerModel;

  late BookInfiniteScrollCubit _bookInfiniteScrollCubit;
  late BookInfiniteScrollMethod _bookInfiniteScrollMethod;
  late BookInfiniteScrollFunction _bookInfiniteScrollFunction;

  HomeControllerModel get homeControllerModel => _homeControllerModel;
  BookInfiniteScrollCubit get bookInfiniteScrollCubit =>
      _bookInfiniteScrollCubit;
  BookInfiniteScrollMethod get bookInfiniteScrollMethod =>
      _bookInfiniteScrollMethod;
  BookInfiniteScrollFunction get bookInfiniteScrollFunction =>
      _bookInfiniteScrollFunction;

  void init() {
    _homeControllerModel = HomeControllerModel();
    _homeControllerModel.init();
    _bookInfiniteScrollCubit = BookInfiniteScrollCubit(0);
    _bookInfiniteScrollCubit.init(
      _homeControllerModel.pagingController,
      BookInfiniteScrollFunction(getData: _getData()),
    );
    _bookInfiniteScrollFunction = BookInfiniteScrollFunction();
    _bookInfiniteScrollMethod = BookInfiniteScrollMethod(
      dataCubit: bookInfiniteScrollCubit,
    );
  }

  HomeViewModel(this.bookApiRepository) {
    _bookInfiniteScrollCubit = BookInfiniteScrollCubit(0);
  }

  _getData() => ({
        required int pageKey,
        required int pageSize,
      }) async {
        final result = await _getBookList();
        List<dynamic> dataList = _bookList;
        result.when(success: (data) {
          dataList = data;
        }, error: (message, statusCode) {
          print(message);
        });
        return dataList;
      };

  Future<Result<List<Book>>> _getBookList() async {
    return await bookApiRepository.getBooks(
      pageSize: 10,
      pageKey: 0,
    );
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
