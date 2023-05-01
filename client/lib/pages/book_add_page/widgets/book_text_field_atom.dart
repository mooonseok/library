import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/widgets/atoms/text_field_atom.dart';
import 'package:flutter/material.dart';

class BookTextFieldAtom extends StatelessWidget {
  final String title;
  final TextEditingController textController;
  final EdgeInsets? padding;
  const BookTextFieldAtom({
    Key? key,
    required this.title,
    required this.textController,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text254Atom('$title:  ', style: TypoType.body1M.getTextStyle()),
          TextFieldAtom(
            textController: textController,
          ),
        ],
      ),
    );
  }
}
