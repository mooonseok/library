part of '../../home_page.dart';

class _BookManageTemplate extends StatelessWidget {
  final HomeViewModel vm;
  const _BookManageTemplate({Key? key, required this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ManagementMenuModel> menuList = [
      ManagementMenuModel('도서 추가', () {
        Navigator.pushNamed(context, BookAddPage.routeName)
            .then((value) => {vm.init()});
      }),
      ManagementMenuModel('도서 삭제', () {
        _deleteModal(context);
      }),
    ];

    return Column(
      children: List.generate(
        menuList.length,
        (index) => ManageListTileTemplate(
          title: menuList[index].title,
          onTap: menuList[index].onTap,
        ),
      ),
    );
  }

  void _deleteModal(
    BuildContext context,
  ) {
    final vm = Provider.of<HomeViewModel>(context, listen: false);

    return regularModalOrganism(
      context,
      titleText: '도서삭제',
      contentsWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text254Atom(
              '삭제할 책의\n고유번호를 입력해주세요.',
              style: TypoType.body1L.getTextStyle(),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: TextFieldAtom(
                  textController: vm.homeControllerModel.deleteIdController,
                ),
              ),
            ),
          ],
        ),
      ),
      regularModalType: RegularModalTypes.basic,
      buttonsData: {
        '취소': () {
          Navigator.pop(context);
          vm.init();
        },
        '삭제': () {
          vm.bookApiRepository.deleteBook(
            int.parse(vm.homeControllerModel.deleteIdController.text),
          );
          Navigator.pop(context);
          vm.init();
        }
      },
    );
  }
}
