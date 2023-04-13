import 'package:client/domain/repository/book_api_repository.dart';
import 'package:client/pages/home/cubits/book_infinite_scroll_cubit.dart';
import 'package:client/pages/home/cubits/check_borrow_cubit.dart';
import 'package:client/pages/home/home_controller_model.dart';

class HomeViewModel {
  final BookApiRepository bookApiRepository;

  late HomeControllerModel _homeControllerModel;

  late BookInfiniteScrollCubit _bookInfiniteScrollCubit;
  late CheckBorrowedCubit _checkBorrowedCubit;

  HomeControllerModel get homeControllerModel => _homeControllerModel;
  BookInfiniteScrollCubit get bookInfiniteScrollCubit =>
      _bookInfiniteScrollCubit;
  CheckBorrowedCubit get checkBorrowedCubit => _checkBorrowedCubit;

  void init() {
    _homeControllerModel = HomeControllerModel();
    _homeControllerModel.init();
    _bookInfiniteScrollCubit = BookInfiniteScrollCubit(0);
    _checkBorrowedCubit = CheckBorrowedCubit(false);
  }

  HomeViewModel(this.bookApiRepository) {
    _bookInfiniteScrollCubit = BookInfiniteScrollCubit(0);
  }
}
