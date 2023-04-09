import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/components/molecules/app_bar254_molecule.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class BookAddPage extends StatelessWidget {
  static const routeName = "/book_add_page";

  const BookAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar254Molecule(
        title: Text254Atom(
          '도서 추가',
          style: TypoType.headLine1B.getTextStyle(),
        ),
      ),
      body: Container(),
    );
  }
}
