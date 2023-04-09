import 'package:client/styles/color_type.dart';
import 'package:client/utility/common_methods/common_method.dart';
import 'package:flutter/material.dart';

enum SmallButtonTypes {
  primary,
  miniPrimary,
  primary50,
  systemGreen,
  systemYellow,
  disabled,
  refresh,
  warning,
  miniPrimaryAdd,
  primary50Reload,
}

extension SmallButtonTypesExtension on SmallButtonTypes {
  Color get textColor {
    Color textColor;
    switch (this) {
      case SmallButtonTypes.primary:
      case SmallButtonTypes.miniPrimary:
      case SmallButtonTypes.refresh:
      case SmallButtonTypes.miniPrimaryAdd:
        textColor = ColorType.systemWhite.color;
        break;
      case SmallButtonTypes.primary50:
      case SmallButtonTypes.primary50Reload:
        textColor = ColorType.primary500.color;
        break;
      case SmallButtonTypes.systemGreen:
        textColor = ColorType.systemGreen.color;
        break;
      case SmallButtonTypes.systemYellow:
        textColor = ColorType.systemOrange.color;
        break;
      case SmallButtonTypes.disabled:
        textColor = ColorType.textSubContents.color;
        break;
      case SmallButtonTypes.warning:
        textColor = ColorType.systemRed.color;
        break;
    }
    return textColor;
  }

  Color get backgroundColor {
    Color backgroundColor;
    switch (this) {
      case SmallButtonTypes.primary:
      case SmallButtonTypes.miniPrimary:
      case SmallButtonTypes.miniPrimaryAdd:
      case SmallButtonTypes.refresh:
        backgroundColor = ColorType.primary500.color;
        break;
      case SmallButtonTypes.primary50:
      case SmallButtonTypes.primary50Reload:
        backgroundColor = ColorType.primary50.color;
        break;
      case SmallButtonTypes.systemGreen:
        backgroundColor = ColorType.pastelGreen.color;
        break;
      case SmallButtonTypes.systemYellow:
        backgroundColor = ColorType.pastelYellow.color;
        break;
      case SmallButtonTypes.disabled:
        backgroundColor = ColorType.gray200.color;
        break;
      case SmallButtonTypes.warning:
        backgroundColor = ColorType.pastelRed.color;
        break;
    }
    return backgroundColor;
  }

  double get padding {
    double padding;
    switch (this) {
      case SmallButtonTypes.primary:
      case SmallButtonTypes.primary50:
      case SmallButtonTypes.systemGreen:
      case SmallButtonTypes.systemYellow:
      case SmallButtonTypes.disabled:
      case SmallButtonTypes.warning:
      case SmallButtonTypes.refresh:
        padding = 70;
        break;
      case SmallButtonTypes.miniPrimary:
      case SmallButtonTypes.primary50Reload:
      case SmallButtonTypes.miniPrimaryAdd:
        padding = 42;
        break;
    }
    return padding;
  }

  Size get fixedSize {
    Size fixedSize;
    switch (this) {
      case SmallButtonTypes.primary:
      case SmallButtonTypes.primary50:
      case SmallButtonTypes.systemGreen:
      case SmallButtonTypes.systemYellow:
      case SmallButtonTypes.disabled:
      case SmallButtonTypes.warning:
      case SmallButtonTypes.refresh:
        fixedSize = Size(CommonMethod.calculate.relativeWidth(277),
            CommonMethod.calculate.relativeHeight(78));
        break;
      case SmallButtonTypes.miniPrimary:
        fixedSize = Size(CommonMethod.calculate.relativeWidth(143),
            CommonMethod.calculate.relativeHeight(70));
        break;
      case SmallButtonTypes.miniPrimaryAdd:
      case SmallButtonTypes.primary50Reload:
        fixedSize = Size(CommonMethod.calculate.relativeWidth(187),
            CommonMethod.calculate.relativeHeight(70));
        break;
    }
    return fixedSize;
  }
}
