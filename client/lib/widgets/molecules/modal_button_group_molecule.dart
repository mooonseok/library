import 'package:client/design_system/components/molecules/button_group254_molecule.dart';
import 'package:client/styles/modal_button_group_types.dart';
import 'package:flutter/material.dart';

class ModalButtonGroupMolecule extends Button254GroupMolecule {
  ModalButtonGroupMolecule({
    Key? key,
    required ModalButtonGroupTypes modalButtonGroupType,
    required List<String> titleTexts,
    required List<void Function()?> onPressedList,
  }) : super(
            key: key,
            buttons: modalButtonGroupType.makeButton(titleTexts, onPressedList),
            flexes: modalButtonGroupType.flexes);
}
