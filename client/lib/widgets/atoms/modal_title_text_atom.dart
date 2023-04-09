import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/styles/regular_modal_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class ModalTitleTextAtom extends StatelessWidget {
  final RegularModalTypes regularModalType;
  final Widget? icon;
  final String titleText;
  final Color color;

  const ModalTitleTextAtom(
      {Key? key,
      this.icon,
      required this.regularModalType,
      required this.titleText,
      required this.color})
      : assert((regularModalType == RegularModalTypes.icon && icon != null) ^
            (regularModalType != RegularModalTypes.icon && icon == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: regularModalType.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (regularModalType == RegularModalTypes.icon) icon!,
          Text254Atom(
            titleText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TypoType.headLine3B.getTextStyle(textColor: color),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
