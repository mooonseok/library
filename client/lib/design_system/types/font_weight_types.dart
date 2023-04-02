import 'package:flutter/material.dart';

enum FontWeightTypes {
  extraBold,
  bold,
  semiBold,
  medium,
  regular,
  light,
  extraLight,
  thin,
}

extension FontWeightExtension on FontWeightTypes {
  FontWeight get fontWeight {
    FontWeight fontWeight;
    switch (this) {
      case FontWeightTypes.extraBold:
        fontWeight = FontWeight.w800;
        break;
      case FontWeightTypes.bold:
        fontWeight = FontWeight.w700;
        break;
      case FontWeightTypes.semiBold:
        fontWeight = FontWeight.w600;
        break;
      case FontWeightTypes.medium:
        fontWeight = FontWeight.w500;
        break;
      case FontWeightTypes.regular:
        fontWeight = FontWeight.w400;
        break;
      case FontWeightTypes.light:
        fontWeight = FontWeight.w300;
        break;
      case FontWeightTypes.extraLight:
        fontWeight = FontWeight.w200;
        break;
      case FontWeightTypes.thin:
        fontWeight = FontWeight.w100;
        break;
    }
    return fontWeight;
  }
}