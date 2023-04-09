import 'package:client/styles/color_type.dart';
import 'package:client/styles/shadow_type.dart';
import 'package:flutter/material.dart';

enum InputStyleType {
  basic,
  line,
}

extension InputStyleTypeExtension on InputStyleType {
  Color get color {
    switch (this) {
      case InputStyleType.basic:
        return ColorType.systemWhite.color;
      case InputStyleType.line:
        return ColorType.primary500.color;
    }
  }

  List<BoxShadow> get shadow {
    switch (this) {
      case InputStyleType.basic:
        return ShadowType.blur06.shadow;
      case InputStyleType.line:
        return [];
    }
  }
}
