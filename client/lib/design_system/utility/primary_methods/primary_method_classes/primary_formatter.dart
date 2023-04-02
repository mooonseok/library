import 'package:intl/intl.dart';

class PrimaryFormatter {
  const PrimaryFormatter();

  /// 숫자를 입력 받아 km, m 단위로 변환한다.
  String distance({required double distance}) {
    String distanceString;
    if (distance > 1) {
      distanceString = "${distance.toStringAsFixed(1)}km";
    } else {
      distanceString = "${(distance * 1000).toStringAsFixed(0)}m";
    }
    return distanceString;
  }

  String addHyphen(String phoneNumber) {
    return "${phoneNumber.substring(0, 3)} - ${phoneNumber.substring(3, 7)} - ${phoneNumber.substring(7, 11)}";
  }

  /// 핸드폰 문자열에서 하이픈(-) 제거
  String removeHyphen(String phoneNumber) {
    final numbers = phoneNumber.split(' - ');
    return numbers[0] + numbers[1] + numbers[2];
  }

  /// 패턴 리스트를 조합하여 문자열 정규식 생성
  RegExp getRegExp(List<String> patterns) {
    String exp = '';
    for (String pattern in patterns) {
      exp += pattern;
    }
    return RegExp('[$exp]');
  }

  /// 성별 표기 전환(남성 -> M, F -> 여성)
  String gender(String input) {
    String output;
    switch (input) {
      case "남성":
        output = "M";
        break;
      case "여성":
        output = "F";
        break;
      case "M":
        output = "남성";
        break;
      case "F":
        output = "여성";
        break;
      default:
        throw Error();
    }
    return output;
  }

  //utc 시간에서 현지시간(대한민국)으로 변경
  DateTime utcToLocal(DateTime utcTime) {
    DateTime localTime;
    DateTime nowDate = DateTime.now();
    localTime =
        utcTime.toLocal().add(Duration(hours: nowDate.timeZoneOffset.inHours));
    return localTime;
  }

  String routeNameFromQuery(String query) {
    final routeArgument = query.split('?');
    return routeArgument.first;
  }

  Map<String, dynamic> argumentsFromQuery(String query) {
    final routeArgument = query.split('?');
    final argumentStrings = routeArgument.last.split('&');
    Map<String, dynamic> arguments = {};
    for (final arg in argumentStrings) {
      final keyVal = arg.split('=');
      arguments[keyVal.first] = keyVal.last;
    }
    return arguments;
  }

  String numberFormatter(String price, String unit) {
    return '${NumberFormat('###,###,###').format(int.parse(price)).replaceAll(' ', '')} $unit';
  }
}