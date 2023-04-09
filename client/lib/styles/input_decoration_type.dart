import 'package:flutter/material.dart';

enum InputDecorationType {
  outline,
  underline,
}

extension InputDecorationTypeExtension on InputDecorationType {
  InputDecoration inputDecoration(
    Color color, {
    String? hintText,
    Widget? prefixIcon,
    double borderWidth = 1.5,
    EdgeInsets? contentPadding,
    Color errorColor = Colors.red,
  }) {
    InputDecoration inputDecoration;

    switch (this) {
      case InputDecorationType.outline:
        inputDecoration = InputDecoration(
          contentPadding: contentPadding,
          counterText: "",
          hintText: hintText,
          focusColor: color,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: borderWidth),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: borderWidth),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        );
        break;
      case InputDecorationType.underline:
        inputDecoration = InputDecoration(
          contentPadding: contentPadding,
          counterText: "",
          hintText: hintText,
          focusColor: color,
          prefixIcon: prefixIcon,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color, width: borderWidth),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: borderWidth),
          ),
        );
        break;
    }
    return inputDecoration;
  }
}
