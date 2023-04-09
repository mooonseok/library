import 'package:client/design_system/types/button_types.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:client/pages/home/widgets/search_button_atom.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/input_decoration_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class SearchBarMolecule extends StatelessWidget {
  final double searchButtonWidth;
  final String? hintText;
  final VoidCallback onSearchButtonPressed;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final double searchBarHeight;
  final double? serachBarWidth;

  const SearchBarMolecule({
    Key? key,
    this.searchButtonWidth = 85,
    this.hintText,
    required this.onSearchButtonPressed,
    this.textStyle,
    this.controller,
    this.searchBarHeight = 50,
    this.serachBarWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = this.controller ?? TextEditingController();
    final textStyle = this.textStyle ?? TypoType.subLine1M.getTextStyle();
    final textSize = PrimaryMethod.calculate.textSize('샘플 텍스트', textStyle);
    final inputDecoration = InputDecorationType.outline
        .inputDecoration(ColorType.textSubContents.color,
            errorColor: ColorType.systemRed.color,
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15, right: 8),
              child: Icon(
                Icons.search,
                size: 25,
                color: ColorType.textSubContents.color,
              ),
            ),
            borderWidth: 2.0,
            contentPadding: EdgeInsets.symmetric(
                vertical: (searchBarHeight - textSize.height) / 2.0))
        .applyDefaults(InputDecorationTheme(
          hintStyle: textStyle.apply(color: ColorType.textSubContents.color),
        ));

    return SizedBox(
      width: serachBarWidth,
      height: searchBarHeight,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextField(
              decoration: inputDecoration,
              style: textStyle,
              controller: controller,
            ),
          )),
          SizedBox(
            width: searchButtonWidth,
            height: searchBarHeight - 5,
            child: ButtonAtom(
              buttonType: ButtonTypes.smallFillStyle,
              onPressed: onSearchButtonPressed,
              title: '검색',
            ),
          ),
        ],
      ),
    );
  }
}
