import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class ManageListTileTemplate extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ManageListTileTemplate(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: ColorType.gray300.color, width: 1),
        ),
      ),
      child: ListTile(
        title: Text254Atom(
          '$title >',
          style: TypoType.subLine1M.getTextStyle(),
        ),
        onTap: onTap,
      ),
    );
  }
}
