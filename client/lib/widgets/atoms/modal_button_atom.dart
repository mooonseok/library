import 'package:client/design_system/components/atoms/button254_atom.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/types/button_types.dart';
import 'package:client/styles/modal_button_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class ModalButtonAtom extends Button254Atom {
  ModalButtonAtom({
    Key? key,
    required String titleText,
    required ModalButtonTypes modalButtonType,
    required void Function()? onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
          titleWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            child: Text254Atom(
              titleText,
              style: TypoType.headLine3M.getTextStyle(
                textColor: modalButtonType.textColor,
              ),
            ),
          ),
          backgroundColor: modalButtonType.backgroundColor,
          buttonType: ButtonTypes.largeFillStyle,
          customBorderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
        );
}
