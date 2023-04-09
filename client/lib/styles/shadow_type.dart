import 'package:client/styles/color_type.dart';
import 'package:flutter/material.dart';

enum ShadowType {
  none,
  blur02,
  blur06,
  blur12,
  blur20,
  blackBlur12,
}

extension ShadowTypeExtension on ShadowType {
  List<BoxShadow> get shadow {
    List<BoxShadow> shadow;

    switch (this) {
      case ShadowType.blur02:
        shadow = _blur02;
        break;
      case ShadowType.blur06:
        shadow = _blur06;
        break;
      case ShadowType.blur12:
        shadow = _blur12;
        break;
      case ShadowType.blur20:
        shadow = _blur20;
        break;
      case ShadowType.blackBlur12:
        shadow = _blackBlur12;
        break;
      case ShadowType.none:
        shadow = [];
        break;
    }
    return shadow;
  }

  List<BoxShadow> get _blur02 => [
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          spreadRadius: 0,
          color: ColorType.grayBlur.color.withOpacity(0.4),
        ),
      ];

  List<BoxShadow> get _blur06 => [
        BoxShadow(
          offset: const Offset(0, 2),
          blurRadius: 6,
          spreadRadius: 0,
          color: ColorType.grayBlur.color.withOpacity(0.4),
        ),
      ];

  List<BoxShadow> get _blur12 => [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 12,
          spreadRadius: 0,
          color: ColorType.grayBlur.color.withOpacity(0.4),
        ),
      ];

  List<BoxShadow> get _blur20 => [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 20,
          spreadRadius: 0,
          color: ColorType.grayBlur.color.withOpacity(0.4),
        ),
      ];

  List<BoxShadow> get _blackBlur12 => [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 12,
          spreadRadius: 0,
          color: ColorType.blackBlur.color.withOpacity(0.4),
        ),
      ];
}
