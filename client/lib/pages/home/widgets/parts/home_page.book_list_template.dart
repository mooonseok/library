part of '../../home_page.dart';

class _BookListTemplate extends StatelessWidget {
  const _BookListTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SearchBarMolecule(
              onSearchButtonPressed: () {},
              hintText: '도서명으로 검색',
              controller: vm.homeControllerModel.searchTextEdittingController,
            ),
          ),
          BookListTabTitleMolecule(),
          Container(
            height: 80.h,
            child: InfiniteScroll254Template(
              infiniteScrollBuilder: vm.bookInfiniteScrollMethod,
              indicatorColor: ColorType.primary300.color,
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
