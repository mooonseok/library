import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/models/book.dart';
import 'package:client/widgets/organisms/regular_modal_organism.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/regular_modal_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class BookListRowMolecule extends StatelessWidget {
  final Book book;
  final Function() onTap;
  const BookListRowMolecule({
    super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        regularModalOrganism(
          context,
          titleText: book.isAbleCheckOut ? '대출' : '반납',
          contentText:
              '${book.name}을 ${book.isAbleCheckOut ? '대출하시겠습니까' : '반납하시겠습니까?'}?',
          regularModalType: RegularModalTypes.basic,
          buttonsData: {
            '취소': () {
              Navigator.pop(context);
            },
            book.isAbleCheckOut ? '대출' : '반납': () {
              Navigator.pop(context);
            }
          },
        );
      },
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: ColorType.gray300.color, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 80,
              child: Text254Atom(
                book.id.toString(),
                style: TypoType.body1M.getTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 120,
              child: Text254Atom(
                book.name,
                style: TypoType.body1M.getTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 150,
              child: Text254Atom(
                book.author,
                style: TypoType.body1M.getTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 130,
              child: Text254Atom(
                book.isAbleCheckOut ? '가능' : '대출 중',
                style: TypoType.body1M.getTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildWidget({
    required Book book,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 43),
      child: BookListRowMolecule(
        book: book,
        onTap: onTap,
      ),
    );
  }
}
