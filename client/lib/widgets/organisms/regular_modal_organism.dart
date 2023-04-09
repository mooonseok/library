import 'package:client/design_system/components/organisms/dialog254_organism.dart';
import 'package:client/design_system/interfaces/valid_check_interface.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/regular_modal_type.dart';
import 'package:client/utility/common_methods/common_method.dart';
import 'package:client/widgets/atoms/modal_title_text_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void regularModalOrganism(
  context, {
  String? titleText,
  Widget? titleWidget,
  String? contentText,
  required RegularModalTypes regularModalType,
  required Map<String, void Function()?> buttonsData,
  TextEditingController? textEditingController,
  ValidCheckInterface? validCheckInterface,
  Color? titleColor,
  Widget? icon,
  Widget? contentsWidget,
  bool barrierDismissible = true,
  bool halfRateButton = false,
}) {
  bool hasNotValidateCheck = PrimaryMethod.check.isNotNull(validCheckInterface);

  Widget buttonWidget() {
    Widget buttons = Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: ColorType.gray200.color, width: 1),
        ),
      ),
      margin: EdgeInsets.only(
        top: CommonMethod.calculate.relativeHeight(25),
      ),
      child: regularModalType.buttonWidget(buttonsData, true,
          isHalf: halfRateButton),
    );
    if (hasNotValidateCheck) {
      return BlocBuilder<ValidCheckInterface, bool>(
        bloc: validCheckInterface,
        builder: (context, state) {
          return buttons;
        },
      );
    } else {
      return buttons;
    }
  }

  titleColor = PrimaryMethod.check.isNull(titleColor)
      ? ColorType.textTitle.color
      : titleColor;
  showDialog(
    context: context,
    builder: (context) {
      return Dialog254Organism(
        isCenter: regularModalType == RegularModalTypes.basic ||
            regularModalType == RegularModalTypes.icon,
        titleWidget: titleWidget ??
            ModalTitleTextAtom(
                regularModalType: regularModalType,
                titleText: titleText!,
                icon: icon,
                color: titleColor!),
        contentsWidget: contentsWidget ??
            regularModalType.contentsWidget(
              contentText: contentText,
              textEditingController: textEditingController,
            ),
        bottomWidget: Align(
          alignment: Alignment.bottomRight,
          child: buttonWidget(),
        ),
        color: ColorType.systemWhite.color,
      );
    },
    barrierDismissible: barrierDismissible,
  );
}
