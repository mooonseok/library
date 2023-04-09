import 'package:client/design_system/components/atoms/button254_atom.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/types/button_types.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class ButtonAtom extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonTypes buttonType;
  final String title;

  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final double widthFactor;

  const ButtonAtom({
    Key? key,
    required this.onPressed,
    required this.buttonType,
    required this.title,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.widthFactor = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ??
        TypoType.headLine3M
            .getTextStyle(textColor: ColorType.systemWhite.color);
    final backgroundColor = this.backgroundColor ?? ColorType.primary500.color;
    final borderColor = this.borderColor ?? ColorType.primary500.color;

    return Button254Atom(
      onPressed: onPressed,
      buttonType: buttonType,
      titleWidget: Text254Atom(
        title,
        style: textStyle,
      ),
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      widthFactor: widthFactor,
    );
  }
}
