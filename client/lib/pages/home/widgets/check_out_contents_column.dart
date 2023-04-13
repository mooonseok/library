import 'package:client/database/book/entities/book.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:client/styles/input_size_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/widgets/atoms/text_field_atom.dart';
import 'package:flutter/material.dart';

class CheckOutContentsColumn extends StatelessWidget {
  final Book book;
  final HomeViewModel vm;
  const CheckOutContentsColumn({
    super.key,
    required this.book,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text254Atom(
          '${book.name}을 ${book.isAbleCheckOut! ? '대출하시겠습니까' : '반납하시겠습니까?'}?',
          style: TypoType.body1R.getTextStyle(),
        ),
        book.isAbleCheckOut!
            ? Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Row(
                    children: [
                      Text254Atom('대출인: ',
                          style: TypoType.body1R.getTextStyle()),
                      Expanded(
                        child: TextFieldAtom(
                          textController:
                              vm.homeControllerModel.borrowerController,
                          inputSize: InputSizeType.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
