import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/modal_button_group_types.dart';
import 'package:client/styles/modal_button_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/widgets/atoms/modal_button_atom.dart';
import 'package:client/widgets/molecules/modal_button_group_molecule.dart';
import 'package:client/widgets/molecules/modal_text_form_field_molecule.dart';
import 'package:flutter/material.dart';

enum RegularModalTypes { basic, icon, addData }

extension RegularModalExtension on RegularModalTypes {
  Widget buttonWidget(
      Map<String, void Function()?> buttonsData, bool validCheck,
      {bool isHalf = false}) {
    Widget buttonWidget;
    List<String> buttonsKey = [];
    List<void Function()?> buttonsValue = [];
    for (String buttonsDataKey in buttonsData.keys) {
      buttonsKey.add(buttonsDataKey);
      buttonsValue.add(buttonsData[buttonsDataKey]);
    }

    switch (this) {
      case RegularModalTypes.basic:
      case RegularModalTypes.addData:
        buttonWidget =
            _getModalButtonGroup(validCheck, isHalf, buttonsKey, buttonsValue);
        break;
      case RegularModalTypes.icon:
        buttonWidget = buttonsData.length < 2
            ? ModalButtonAtom(
                titleText: buttonsData.keys.first,
                modalButtonType: ModalButtonTypes.gray100,
                onPressed: buttonsData[buttonsData.keys.first])
            : _getModalButtonGroup(
                validCheck, isHalf, buttonsKey, buttonsValue);
        break;
    }
    return buttonWidget;
  }

  EdgeInsets get padding {
    EdgeInsets padding;
    switch (this) {
      case RegularModalTypes.basic:
      case RegularModalTypes.addData:
        padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
        break;
      case RegularModalTypes.icon:
        padding = const EdgeInsets.fromLTRB(15, 10, 15, 0);
        break;
    }
    return padding;
  }

  Widget contentsWidget({
    String? contentText,
    TextEditingController? textEditingController,
  }) {
    Widget contentsWidget;
    switch (this) {
      case RegularModalTypes.basic:
      case RegularModalTypes.icon:
        contentsWidget = Padding(
          padding: padding,
          child: Text254Atom(
            contentText!,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TypoType.subLine1L
                .getTextStyle(textColor: ColorType.textTitle.color),
          ),
        );
        break;
      case RegularModalTypes.addData:
        contentsWidget = ModalTextFormFieldMolecule(
          padding: padding,
          contentText: contentText,
          textEditingController: textEditingController,
        );
        break;
    }
    return contentsWidget;
  }
}

ModalButtonGroupMolecule _getModalButtonGroup(bool validCheck, bool isHalf,
    List<String> buttonsKey, List<void Function()?> buttonsValue) {
  return ModalButtonGroupMolecule(
      modalButtonGroupType: validCheck
          ? isHalf
              ? ModalButtonGroupTypes.primary5050
              : ModalButtonGroupTypes.primary3070
          : isHalf
              ? ModalButtonGroupTypes.enable5050
              : ModalButtonGroupTypes.enable3070,
      titleTexts: buttonsKey,
      onPressedList: buttonsValue);
}
