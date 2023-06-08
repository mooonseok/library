part of '../../home_page.dart';

class _BookListTemplate extends StatelessWidget {
  final HomeViewModel vm;
  const _BookListTemplate({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    vm.bookInfiniteScrollCubit.init(
      vm.homeControllerModel.pagingController,
      BookInfiniteScrollFunction(getData: _getData(vm)),
    );
    BookInfiniteScrollMethod bookInfiniteScrollMethod =
        BookInfiniteScrollMethod(
      dataCubit: vm.bookInfiniteScrollCubit,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          CheckBoxAtom(vm: vm),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SearchBarMolecule(
              onSearchButtonPressed: () {
                vm.homeControllerModel.pagingController.refresh();
              },
              onChanged: (value) {
                vm.homeControllerModel.pagingController.refresh();
              },
              hintText: '도서명으로 검색',
              controller: vm.homeControllerModel.searchTextEdittingController,
            ),
          ),
          const BookListTabTitleMolecule(),
          SizedBox(
            height: 60.h,
            child: InfiniteScroll254Template(
              infiniteScrollBuilder: bookInfiniteScrollMethod,
              indicatorColor: ColorType.primary300.color,
              pagingController: vm.homeControllerModel.pagingController,
              firstPageErrorIndicatorBuilder: _defaultErrorBuilder,
              noItemsFoundIndicatorBuilder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: CommonMethod.calculate.relativeHeight(312),
                  ),
                  child: Text254Atom(
                    '책이 없습니다.',
                    style: TypoType.body1M.getTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _defaultErrorBuilder(BuildContext context, VoidCallback refresh) =>
      ErrorNotifierMolecule(
        retryButtonCallback: () => refresh(),
      );

  _getData(
    HomeViewModel vm,
  ) =>
      ({
        required int pageKey,
        required int pageSize,
        bool? unable,
        String? keyword,
      }) async {
        final result = await _getBookList(
          pageKey: pageKey,
          pageSize: pageSize,
          vm: vm,
        );
        List<dynamic> dataList = [];
        dataList = result;
        return dataList;
      };

  Future<List<Book>> _getBookList({
    required int pageKey,
    required int pageSize,
    required HomeViewModel vm,
  }) async {
    return await vm.bookApiRepository.getBooks(
      bookListApiModel: BookListApiModel(
        pageKey: pageKey,
        pageSize: pageSize,
        isAbleToCheckOut: vm.checkBorrowedCubit.state ? true : null,
        keyword: vm.homeControllerModel.searchTextEdittingController.text,
      ),
    );
  }
}
