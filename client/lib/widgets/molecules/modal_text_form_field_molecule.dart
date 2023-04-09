import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/input_decoration_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class ModalTextFormFieldMolecule extends StatelessWidget {
  final EdgeInsets padding;
  final String? contentText;
  final TextEditingController? textEditingController;

  const ModalTextFormFieldMolecule(
      {Key? key,
      required this.padding,
      this.contentText,
      this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 18),
            child: Text254Atom(
                PrimaryMethod.check.isNotNull(contentText)
                    ? contentText!
                    : "카테고리",
                style: TypoType.body1R
                    .getTextStyle(textColor: ColorType.primary700.color)),
          ),
          TextFormField(
            controller: textEditingController,
            cursorColor: ColorType.primary600.color,
            autocorrect: false,
            style: TypoType.subLine1M.getTextStyle(),
            decoration: InputDecorationType.underline.inputDecoration(
              ColorType.primary600.color,
              errorColor: ColorType.systemRed.color,
            ),
          ),
        ],
      ),
    );
  }
}
