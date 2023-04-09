import 'package:client/design_system/components/atoms/button254_atom.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/types/button_types.dart';
import 'package:client/styles/small_button_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/utility/common_methods/common_method.dart';
import 'package:flutter/material.dart';

class SmallButtonAtom extends Button254Atom {
  SmallButtonAtom({
    Key? key,
    required void Function()? onPressed,
    required String titleText,
    required SmallButtonTypes smallButtonType,
    TextStyle? titleStyle,
  }) : super(
          key: key,
          titleWidget: _getTitleWidget(smallButtonType, titleText, titleStyle),
          fixedSize: smallButtonType.fixedSize,
          onPressed: onPressed,
          buttonType: ButtonTypes.smallFillStyle,
          shadowColor: Colors.transparent,
          backgroundColor: smallButtonType.backgroundColor,
        );

  static Container _getTitleWidget(SmallButtonTypes smallButtonType,
      String titleText, TextStyle? titleStyle) {
    Widget textWidget = Text254Atom(
      titleText,
      overflow: TextOverflow.ellipsis,
      style: titleStyle ??
          TypoType.headLine3M.getTextStyle(
            textColor: smallButtonType.textColor,
          ),
    );
    textWidget = smallButtonType == SmallButtonTypes.refresh
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.only(right: 11),
              child: Icon(
                Icons.replay,
              ),
            ),
            textWidget,
          ])
        : textWidget;
    final width = smallButtonType == SmallButtonTypes.miniPrimary
        ? CommonMethod.calculate.relativeWidth(100)
        : CommonMethod.calculate.relativeWidth(277);

    return Container(
      alignment: Alignment.center,
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
      child: textWidget,
    );
  }
}
