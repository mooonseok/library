import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class BookListTabTitleMolecule extends StatelessWidget {
  const BookListTabTitleMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(color: ColorType.gray500.color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 80,
            child: Text254Atom(
              '번호',
              style: TypoType.body1M.getTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 120,
            child: Text254Atom(
              '이름',
              style: TypoType.body1M.getTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 150,
            child: Text254Atom(
              '저자',
              style: TypoType.body1M.getTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 130,
            child: Text254Atom(
              '대출여부',
              style: TypoType.body1M.getTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 130,
            child: Text254Atom(
              '대출인',
              style: TypoType.body1M.getTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
