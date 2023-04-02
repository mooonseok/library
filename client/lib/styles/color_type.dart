import 'package:flutter/material.dart';

enum ColorType {
  //Primary
  primary700,
  primary600,
  primary500,
  primary400,
  primary300,
  primary50,

  //Text
  textTitle,
  textContents,
  textSubContents,
  textPlaceHolder,

  //Gray
  gray600,
  gray500,
  gray400,
  gray300,
  gray200,
  gray100,

  //System
  systemRed,
  systemOrange,
  systemYellow,
  systemGreen,
  systemSkyBlue,
  systemBlue,
  systemPurple,
  systemWhite,

  //Pastel
  pastelRed,
  pastelOrange,
  pastelYellow,
  pastelGreen,
  pastelSkyBlue,
  pastelBlue,
  pastelPruple,

  //Shadow
  grayBlur,
  blackBlur,
}

extension ColorTypesExtension on ColorType {
  Color get color {
    Color color;
    switch (this) {
      /******** Primary ********/
      case ColorType.primary700:
        color = const Color(0xFF0055C1);
        break;
      case ColorType.primary600:
        color = const Color(0xFF005FD9);
        break;
      case ColorType.primary500:
        color = const Color(0xFF0075F4);
        break;
      case ColorType.primary400:
        color = const Color(0xFF78B8FF);
        break;
      case ColorType.primary300:
        color = const Color(0xFFB3D7FF);
        break;
      case ColorType.primary50:
        color = const Color(0xFFEBF8FF);
        break;

      /******** Text ********/
      case ColorType.textTitle:
        color = const Color(0xFF000000);
        break;
      case ColorType.textContents:
        color = const Color(0xFF8A8A8E);
        break;
      case ColorType.textSubContents:
        color = const Color(0xFFC5C5C7);
        break;
      case ColorType.textPlaceHolder:
        color = const Color(0xFFDCDCDD);
        break;

      /******** Gray ********/
      case ColorType.gray600:
        color = const Color(0xFF8E8E93);
        break;
      case ColorType.gray500:
        color = const Color(0xFFAEAEB2);
        break;
      case ColorType.gray400:
        color = const Color(0xFFC7C7CC);
        break;
      case ColorType.gray300:
        color = const Color(0xFFD1D1D6);
        break;
      case ColorType.gray200:
        color = const Color(0xFFE5E5EA);
        break;
      case ColorType.gray100:
        color = const Color(0xFFF7F8F9);
        break;
      /******** System ********/
      case ColorType.systemRed:
        color = const Color(0xFFFF3B30);
        break;
      case ColorType.systemOrange:
        color = const Color(0xFFFF9500);
        break;
      case ColorType.systemYellow:
        color = const Color(0xFFFFCC00);
        break;
      case ColorType.systemGreen:
        color = const Color(0xFF34C759);
        break;
      case ColorType.systemSkyBlue:
        color = const Color(0xFF5AC8FA);
        break;
      case ColorType.systemBlue:
        color = const Color(0xFF0075F4);
        break;
      case ColorType.systemPurple:
        color = const Color(0xFF8833FF);
        break;
      case ColorType.systemWhite:
        color = const Color(0xFFFFFFFF);
        break;

      /******** Pastel ********/
      case ColorType.pastelRed:
        color = const Color(0xFFFFE2E0);
        break;
      case ColorType.pastelOrange:
        color = const Color(0xFFFF9500);
        break;
      case ColorType.pastelYellow:
        color = const Color(0xFFFFF7D9);
        break;
      case ColorType.pastelGreen:
        color = const Color(0xFFE1F7E6);
        break;
      case ColorType.pastelSkyBlue:
        color = const Color(0xFFE6F7FE);
        break;
      case ColorType.pastelBlue:
        color = const Color(0xFFD9EAFD);
        break;
      case ColorType.pastelPruple:
        color = const Color(0xFFF2EAFF);
        break;

      /******** Shadow ********/
      case ColorType.grayBlur:
        color = const Color(0xFFB5B9BD);
        break;
      case ColorType.blackBlur:
        color = const Color(0xFF111111);
        break;
    }

    return color;
  }
}