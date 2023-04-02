
import 'package:client/design_system/utility/primary_methods/primary_method_classes/primary_calculator.dart';
import 'package:client/design_system/utility/primary_methods/primary_method_classes/primary_checker.dart';
import 'package:client/design_system/utility/primary_methods/primary_method_classes/primary_formatter.dart';

abstract class PrimaryMethod {
  static const check = PrimaryChecker();
  static const calculate = PrimaryCalculator();
  static const format = PrimaryFormatter();
}