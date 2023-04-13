import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/input_size_type.dart';
import 'package:client/styles/input_style_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/utility/common_methods/common_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldAtom extends StatefulWidget {
  static final _defaultTextStyle = TypoType.body1R.getTextStyle();
  static EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: CommonMethod.calculate.relativeWidth(20),
    vertical: CommonMethod.calculate.relativeHeight(15),
  );

  final String hintText;
  final TextStyle? hintStyle;
  final TextEditingController textController;
  final InputSizeType inputSize;
  final InputStyleType inputStyle;
  final int maxLines;
  final Widget? suffixIcon;
  final void Function(String text)? onChanged;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;

  const TextFieldAtom({
    Key? key,
    this.hintText = '',
    this.hintStyle,
    required this.textController,
    this.inputSize = InputSizeType.basic,
    this.inputStyle = InputStyleType.basic,
    this.maxLines = 1,
    this.suffixIcon,
    this.onChanged,
    this.textStyle,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.inputFormatters,
    this.suffix,
  }) : super(key: key);

  @override
  State<TextFieldAtom> createState() => _TextFieldAtomState();

  static double getHeight({int maxLines = 1, TextStyle? style}) {
    final textSize = PrimaryMethod.calculate
        .textSize('가나다', style ?? _defaultTextStyle, maxLines: maxLines);

    return (textSize.height * maxLines) + contentPadding.vertical + 2;
  }
}

class _TextFieldAtomState extends State<TextFieldAtom> {
  final _focus = FocusNode();
  List<BoxShadow> shadow = [];

  @override
  void initState() {
    super.initState();
    shadow = widget.inputStyle.shadow;
    _focus.addListener(_onFocusChanged);
  }

  @override
  Widget build(BuildContext context) {
    final defaultHintStyle = TextFieldAtom._defaultTextStyle.apply(
      color: ColorType.textContents.color,
    );

    final outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: widget.inputStyle.color),
        borderRadius: const BorderRadius.all(Radius.circular(12)));

    final onFocusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: InputStyleType.line.color),
        borderRadius: const BorderRadius.all(Radius.circular(12)));
    return Container(
      width: widget.inputSize.width,
      height: TextFieldAtom.getHeight(
          maxLines: widget.maxLines, style: widget.textStyle),
      decoration: BoxDecoration(boxShadow: shadow),
      child: TextField(
        controller: widget.textController,
        focusNode: _focus,
        maxLines: widget.maxLines,
        autofocus: false,
        style: widget.textStyle ?? TextFieldAtom._defaultTextStyle,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        readOnly: widget.readOnly!,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          suffix: widget.suffix,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          fillColor: ColorType.systemWhite.color,
          filled: true,
          hintStyle: widget.hintStyle ?? defaultHintStyle,
          contentPadding: TextFieldAtom.contentPadding,
          border: outlineInputBorder,
          errorBorder: outlineInputBorder,
          focusedBorder: onFocusedBorder,
          enabledBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
        ),
      ),
    );
  }

  void _onFocusChanged() {
    setState(() {
      shadow = _focus.hasFocus
          ? InputStyleType.line.shadow
          : widget.inputStyle.shadow;
    });
  }
}
