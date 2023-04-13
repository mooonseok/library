import 'package:client/utility/common_methods/common_method.dart';

enum InputSizeType {
  long,
  basic, //default
  medium,
  full,
}

extension InputSizeExtension on InputSizeType {
  double get width {
    double value;
    switch (this) {
      case InputSizeType.long:
        value = 580;
        break;
      case InputSizeType.basic:
        value = 450;
        break;
      case InputSizeType.medium:
        value = 384;
        break;
      case InputSizeType.full:
        value = 694;
        break;
    }
    return CommonMethod.calculate.relativeWidth(value);
  }
}
