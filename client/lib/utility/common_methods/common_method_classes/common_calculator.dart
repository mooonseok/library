import 'package:client/design_system/utility/primary_methods/primary_method_classes/primary_calculator.dart';

import '../../constants/const_device_props.dart';
import '../../constants/const_values.dart';

class CommonCalculator extends PrimaryCalculator {
  static final _instance = CommonCalculator._();
  static CommonCalculator get instance => _instance;

  CommonCalculator._();

  /// 화면 대비 위젯의 너비를 계산하여 반환한다.
  double relativeWidth(
    double intendedWidth, {
    double standardScreenWidth = ConstValues.standardScreenWidth,
  }) {
    double screenWidth = ConstDeviceProps.screenWidth;
    return intendedWidth * screenWidth / standardScreenWidth;
  }

  /// 화면 대비 위젯의 높이를 계산하여 반환한다.
  double relativeHeight(
    double intendedHeight, {
    double standardScreenHeight = ConstValues.standardScreenHeight,
  }) {
    double screenHeight = ConstDeviceProps.screenHeight;
    return intendedHeight * screenHeight / standardScreenHeight;
  }

  //날짜 계산 메소드

}