part of '../../home_page.dart';

class _BookManageTemplate extends StatelessWidget {
  const _BookManageTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ManagementMenuModel> menuList = [
      ManagementMenuModel('대출 명부', () {}),
      ManagementMenuModel('도서 추가', () {}),
      ManagementMenuModel('도서 삭제', () {}),
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
