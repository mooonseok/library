import 'package:client/design_system/types/font_weight_types.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/utility/constants/const_device_props.dart';
import 'package:flutter/material.dart';

enum TypoType {
  //HeadLine
  headLine1B,
  headLine1M,
  headLine2B,
  headLine2M,
  headLine3B,
  headLine3M,
  headLine3R,

  //SubLine
  subLine1B,
  subLine1M,
  subLine1R,
  subLine1L,

  //Body
  body1B,
  body1M,
  body1R,
  body1L,
}

extension TypoTypeExtension on TypoType {
  TextStyle generator({
    required FontWeight fontWeight,
    required double fontSize,
    double height = 1.0,
    Color? color,
    String fontFamily = "SpoqaHanSansNeo",
  }) =>
      TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize * ConstDeviceProps.screenRatio,
        height: height,
        color: color ?? ColorType.textTitle.color,
        fontFamily: fontFamily,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle getTextStyle({Color? textColor}) {
    TextStyle typo;

    switch (this) {
      /******** HeadLine ********/
      case TypoType.headLine1B:
        typo = generator(
          fontWeight: FontWeightTypes.bold.fontWeight,
          fontSize: 48,
          height: 1.333,
          color: textColor,
        );
        break;
      case TypoType.headLine1M:
        typo = generator(
          fontWeight: FontWeightTypes.medium.fontWeight,
          fontSize: 48,
          height: 1.333,
          color: textColor,
        );
        break;
      case TypoType.headLine2B:
        typo = generator(
          fontWeight: FontWeightTypes.bold.fontWeight,
          fontSize: 40,
          height: 1.4,
          color: textColor,
        );
        break;
      case TypoType.headLine2M:
        typo = generator(
          fontWeight: FontWeightTypes.medium.fontWeight,
          fontSize: 40,
          height: 1.4,
          color: textColor,
        );
        break;
      case TypoType.headLine3B:
        typo = generator(
          fontWeight: FontWeightTypes.bold.fontWeight,
          fontSize: 32,
          height: 1.5,
          color: textColor,
        );
        break;
      case TypoType.headLine3M:
        typo = generator(
          fontWeight: FontWeightTypes.medium.fontWeight,
          fontSize: 32,
          height: 1.5,
          color: textColor,
        );
        break;

      case TypoType.headLine3R:
        typo = generator(
          fontWeight: FontWeightTypes.regular.fontWeight,
          fontSize: 32,
          height: 1.5,
          color: textColor,
        );
        break;

      /******** SubLine ********/
      case TypoType.subLine1B:
        typo = generator(
          fontWeight: FontWeightTypes.bold.fontWeight,
          fontSize: 28,
          height: 1.14,
          color: textColor,
        );
        break;
      case TypoType.subLine1M:
        typo = generator(
          fontWeight: FontWeightTypes.medium.fontWeight,
          fontSize: 28,
          height: 1.14,
          color: textColor,
        );
        break;
      case TypoType.subLine1R:
        typo = generator(
          fontWeight: FontWeightTypes.regular.fontWeight,
          fontSize: 28,
          height: 1.14,
          color: textColor,
        );
        break;
      case TypoType.subLine1L:
        typo = generator(
          fontWeight: FontWeightTypes.light.fontWeight,
          fontSize: 28,
          height: 1.14,
          color: textColor,
        );
        break;

      /******** Body ********/
      case TypoType.body1B:
        typo = generator(
          fontWeight: FontWeightTypes.bold.fontWeight,
          fontSize: 24,
          height: 1.33,
          color: textColor,
        );
        break;
      case TypoType.body1M:
        typo = generator(
          fontWeight: FontWeightTypes.medium.fontWeight,
          fontSize: 24,
          height: 1.33,
          color: textColor,
        );
        break;
      case TypoType.body1R:
        typo = generator(
          fontWeight: FontWeightTypes.regular.fontWeight,
          fontSize: 24,
          height: 1.33,
          color: textColor,
        );
        break;
      case TypoType.body1L:
        typo = generator(
          fontWeight: FontWeightTypes.light.fontWeight,
          fontSize: 24,
          height: 1.33,
          color: textColor,
        );
        break;
    }
    return typo;
  }
}