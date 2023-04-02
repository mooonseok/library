import 'common_method_classes/common_calculator.dart';
import 'common_method_classes/common_checkers.dart';
import 'common_method_classes/common_formatters.dart';

abstract class CommonMethod {
  static final CommonCheckers check = CommonCheckers.instance;
  static final CommonCalculator calculate = CommonCalculator.instance;
  static final CommonFormatter format = CommonFormatter.instance;
}