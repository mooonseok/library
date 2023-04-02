
import 'package:sizer/sizer.dart';

import 'const_values.dart';

abstract class ConstDeviceProps {
  static double get screenWidth => 100.w;
  static double get screenHeight => 100.h;
  static double get screenRatio =>
      screenWidth / ConstValues.standardScreenWidth;
}