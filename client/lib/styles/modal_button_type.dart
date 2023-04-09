import 'package:client/styles/color_type.dart';
import 'package:flutter/material.dart';

enum ModalButtonTypes {
  primary100,
  gray100,
}

extension ModalButtonExtension on ModalButtonTypes {
  Color get backgroundColor {
    Color backgroundColor;
    switch (this) {
      case ModalButtonTypes.primary100:
        backgroundColor = ColorType.primary500.color;
        break;
      case ModalButtonTypes.gray100:
        backgroundColor = ColorType.gray100.color;
        break;
    }
    return backgroundColor;
  }

  Color get textColor {
    Color textColor;
    switch (this) {
      case ModalButtonTypes.primary100:
        textColor = ColorType.systemWhite.color;
        break;
      case ModalButtonTypes.gray100:
        textColor = ColorType.primary500.color;
        break;
    }
    return textColor;
  }
}
