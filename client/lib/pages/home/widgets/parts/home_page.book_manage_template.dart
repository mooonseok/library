part of '../../home_page.dart';

class _BookManageTemplate extends StatelessWidget {
  final HomeViewModel vm;
  const _BookManageTemplate({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    vm.init();
    List<ManagementMenuModel> menuList = [
      ManagementMenuModel('도서 추가', () {
        Navigator.pushNamed(context, BookAddPage.routeName);
      }),
      ManagementMenuModel('도서 삭제', () {
        bookDeleteModalOrganism(context, vm);
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
}
