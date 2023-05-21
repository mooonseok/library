import 'package:client/database/book/dto/create_book_dto.dart';
import 'package:client/design_system/types/button_types.dart';
import 'package:client/pages/book_add_page/book_add_view_model.dart';
import 'package:client/pages/home/home_page.dart';
import 'package:client/pages/home/widgets/search_button_atom.dart';
import 'package:flutter/material.dart';

class BookAddPageBottomButtonAtom extends StatelessWidget {
  final BookAddViewModel vm;
  const BookAddPageBottomButtonAtom({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonAtom(
      onPressed: () async {
        await vm.bookApiRepository.createBook(
          CreateBookDTO(
            name: vm.bookAddControllers.nameController.text,
            author: vm.bookAddControllers.authorController.text,
            publisher: vm.bookAddControllers.publisherController.text,
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.popUntil(context, ModalRoute.withName(HomePage.routeName));
      },
      buttonType: ButtonTypes.regularFillStyle,
      title: '등록',
    );
  }
}
