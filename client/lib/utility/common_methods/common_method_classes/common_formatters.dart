import 'dart:io';
import 'dart:math';

import 'package:client/design_system/utility/primary_methods/primary_method_classes/primary_formatter.dart';
import 'package:client/utility/constants/const_paths.dart';
import 'package:intl/intl.dart';
class CommonFormatter extends PrimaryFormatter {
  static final _instance = CommonFormatter._();
  static get instance => _instance;

  CommonFormatter._();

  /// [file]의 크기를 계산하여 단위와 함께 반환한다.
  /// [decimals] 파라미터로 소수점 아래 몇 번째 자리까지 표현할지 결정한다.
  Future<String> fileSize(File file, int decimals) async {
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  /// [ConstPaths.imageAssets] + [fileName] 문자열 반환
  String assetImageDirectory(String fileName) {
    if (fileName.contains(ConstPaths.imageAssets)) return fileName;
    fileName = fileName.split('/').last;
    return ConstPaths.imageAssets + fileName;
  }

  String thousandFormatter(int input) {
    String output;
    var format = NumberFormat('###,###,###,###');
    output = format.format(input);
    return output;
  }

  String urlPath({
    required num version,
    required String mainPath,
    String additional = '',
  }) {
    final base = '/api/v$version/$mainPath';
    final path = additional.isNotEmpty ? '$base/$additional' : base;
    return path;
  }

  DateTime trimDate(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  String toKebobCase(DateTime date) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  String? addDashToPhoneNumber(String phoneNumber) {
    try {
      final split = [
        phoneNumber.substring(0, 3),
        phoneNumber.substring(3, 7),
        phoneNumber.substring(7, 11),
      ];
      return '${split[0]}-${split[1]}-${split[2]}';
    } catch (e) {
      return null;
    }
  }

  String? addDashToResidentRegistrationNumber(String rrn) {
    try {
      final split = [rrn.substring(0, 6), rrn.substring(6, 13)];
      return '${split[0]} - ${split[1]}';
    } catch (e) {
      return null;
    }
  }
}