import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/components/molecules/app_bar254_molecule.dart';
import 'package:client/pages/book_add_page/book_add_view_model.dart';
import 'package:client/pages/book_add_page/models/book_input_information_model.dart';
import 'package:client/pages/book_add_page/widgets/book_add_page_bottom_button_atom.dart';
import 'package:client/pages/book_add_page/widgets/book_add_page_template.dart';
import 'package:client/pages/book_add_page/widgets/book_text_field_atom.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'widgets/parts/book_add_page.book_information_input_organism.dart';

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
      body: BookAddPageTemplate(
        contents: _BookInformationInputOrganism(vm: vm),
        bottomButton: BookAddPageBottomButtonAtom(vm: vm),
      ),
    );
  }
}
