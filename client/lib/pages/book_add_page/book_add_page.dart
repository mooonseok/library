import 'package:client/database/book/dto/create_book_dto.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/components/molecules/app_bar254_molecule.dart';
import 'package:client/design_system/types/button_types.dart';
import 'package:client/pages/book_add_page/book_add_view_model.dart';
import 'package:client/pages/home/home_page.dart';
import 'package:client/pages/home/widgets/search_button_atom.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/widgets/atoms/text_field_atom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BookAddPage extends StatelessWidget {
  static const routeName = "/book_add_page";

  const BookAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BookAddViewModel>(context);
    vm.init();
    return Scaffold(
      appBar: AppBar254Molecule(
        title: Text254Atom(
          '도서 추가',
          style: TypoType.headLine1B.getTextStyle(),
        ),
        backgroundColor: ColorType.systemPurple.color,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 80.h,
                child: Column(
                  children: [
                    Expanded(
                      flex: 13,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text254Atom('이름:  ',
                                    style: TypoType.body1M.getTextStyle()),
                                TextFieldAtom(
                                    textController:
                                        vm.bookAddControllers.nameController),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text254Atom(
                                  '작가:  ',
                                  style: TypoType.body1M.getTextStyle(),
                                ),
                                TextFieldAtom(
                                  textController:
                                      vm.bookAddControllers.authorController,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text254Atom('출판사:  ',
                                    style: TypoType.body1M.getTextStyle()),
                                TextFieldAtom(
                                    textController: vm.bookAddControllers
                                        .publisherController),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ButtonAtom(
                        onPressed: () async {
                          await vm.bookApiRepository.createBook(
                            CreateBookDTO(
                              name: vm.bookAddControllers.nameController.text,
                              author:
                                  vm.bookAddControllers.authorController.text,
                              publisher: vm
                                  .bookAddControllers.publisherController.text,
                            ),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.popUntil(
                              context, ModalRoute.withName(HomePage.routeName));
                        },
                        buttonType: ButtonTypes.regularFillStyle,
                        title: '등록',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
