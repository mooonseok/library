import 'package:client/design_system/components/atoms/button254_atom.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/types/button_types.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

enum ModalButtonGroupTypes {
  primary5050,
  gray5050,
  primary3070,
  gray3070,
  enable3070,
  enable5050,
}

extension ModalButtonGroupTypesExtension on ModalButtonGroupTypes {
  List<int> get flexes {
    List<int> flexes;
    switch (this) {
      case ModalButtonGroupTypes.primary5050:
      case ModalButtonGroupTypes.gray5050:
      case ModalButtonGroupTypes.enable5050:
        flexes = [1, 1];
        break;
      case ModalButtonGroupTypes.primary3070:
      case ModalButtonGroupTypes.enable3070:
      case ModalButtonGroupTypes.gray3070:
        flexes = [3, 7];
        break;
    }
    return flexes;
  }

  List<Color> get backgroundColors {
    List<Color> backgroundColors;
    switch (this) {
      case ModalButtonGroupTypes.primary5050:
        backgroundColors = [
          ColorType.gray100.color,
          ColorType.primary500.color
        ];
        break;
      case ModalButtonGroupTypes.primary3070:
        backgroundColors = [
          ColorType.systemWhite.color,
          ColorType.primary500.color
        ];
        break;
      case ModalButtonGroupTypes.gray5050:
      case ModalButtonGroupTypes.gray3070:
        backgroundColors = [
          ColorType.systemWhite.color,
          ColorType.gray100.color
        ];
        break;
      case ModalButtonGroupTypes.enable3070:
      case ModalButtonGroupTypes.enable5050:
        backgroundColors = [
          ColorType.systemWhite.color,
          ColorType.gray200.color
        ];
        break;
    }
    return backgroundColors;
  }

  List<Color> get textColors {
    List<Color> textColors;
    switch (this) {
      case ModalButtonGroupTypes.primary5050:
        textColors = [ColorType.systemBlue.color, ColorType.systemWhite.color];
        break;
      case ModalButtonGroupTypes.primary3070:
        textColors = [ColorType.primary500.color, ColorType.systemWhite.color];
        break;
      case ModalButtonGroupTypes.gray5050:
      case ModalButtonGroupTypes.gray3070:
        textColors = [ColorType.primary500.color, ColorType.textTitle.color];
        break;
      case ModalButtonGroupTypes.enable5050:
      case ModalButtonGroupTypes.enable3070:
        textColors = [
          ColorType.primary500.color,
          ColorType.textSubContents.color
        ];
        break;
    }
    return textColors;
  }

  List<Button254Atom> makeButton(
      List<String> titleTexts, List<void Function()?> onPressedList) {
    List<Button254Atom> makeButton = [];
    for (int i = 0; i < flexes.length; i++) {
      makeButton.add(
        Button254Atom(
          onPressed: onPressedList[i],
          buttonType: ButtonTypes.regularFillStyle,
          titleWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            child: Text254Atom(
              titleTexts[i],
              style: TypoType.headLine3M.getTextStyle(
                textColor: textColors[i],
              ),
            ),
          ),
          splashColor: backgroundColors[i] == Colors.white ? Colors.grey : null,
          backgroundColor: backgroundColors[i],
          customBorderRadius: i == 0
              ? const BorderRadius.only(bottomLeft: Radius.circular(20))
              : const BorderRadius.only(bottomRight: Radius.circular(20)),
        ),
      );
    }
    return makeButton;
  }
}
