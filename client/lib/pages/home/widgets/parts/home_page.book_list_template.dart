part of '../../home_page.dart';

class _BookListTemplate extends StatelessWidget {
  final BookInfiniteScrollMethod bookInfiniteScrollMethod;
  const _BookListTemplate({
    Key? key,
    required this.bookInfiniteScrollMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

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
}
