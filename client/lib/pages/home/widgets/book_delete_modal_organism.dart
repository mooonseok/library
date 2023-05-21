import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:client/styles/regular_modal_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/widgets/atoms/text_field_atom.dart';
import 'package:client/widgets/organisms/regular_modal_organism.dart';
import 'package:flutter/material.dart';

void bookDeleteModalOrganism(context, HomeViewModel vm) {
  return regularModalOrganism(
    context,
    titleText: '도서삭제',
    contentsWidget: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text254Atom(
            '삭제할 책의\n고유번호를 입력해주세요.',
            style: TypoType.body1L.getTextStyle(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: TextFieldAtom(
                textController: vm.homeControllerModel.deleteIdController,
              ),
            ),
          ),
        ],
      ),
    ),
    regularModalType: RegularModalTypes.basic,
    buttonsData: {
      '취소': () {
        Navigator.pop(context);
        vm.init();
      },
      '삭제': () {
        vm.bookApiRepository.deleteBook(
          int.parse(vm.homeControllerModel.deleteIdController.text),
        );
        Navigator.pop(context);
        vm.init();
      }
    },
  );
}
