part of '../../book_add_page.dart';

class _BookInformationInputOrganism extends StatelessWidget {
  final BookAddViewModel vm;
  const _BookInformationInputOrganism({Key? key, required this.vm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BookInputInformationModel> inputInformations = [
      BookInputInformationModel('이름', vm.bookAddControllers.nameController),
      BookInputInformationModel('작가', vm.bookAddControllers.authorController),
      BookInputInformationModel(
          '출판사', vm.bookAddControllers.publisherController),
    ];

    return Column(
      children: inputInformations
          .map((element) => BookTextFieldAtom(
                title: element.title,
                textController: element.textController,
              ))
          .toList(),
    );
  }
}
