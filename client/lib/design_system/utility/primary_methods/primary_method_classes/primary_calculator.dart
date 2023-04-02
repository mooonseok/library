import 'dart:math';

import 'package:flutter/material.dart';

class PrimaryCalculator {
  const PrimaryCalculator();
  double getRadiusFrom({required double angle}) {
    return angle * pi / 180;
  }

  /// 출발 위도, 경도와 도착 위도, 경도를 입력받아 거리를 반환한다.
  double distance(double fromLongitude, double fromLatitude, double toLongitude,
      double toLatitude) {
    int R = 6371; // km
    double dLat = getRadiusFrom(angle: (fromLatitude - toLatitude).abs());
    double dLon = getRadiusFrom(angle: (fromLongitude - toLongitude).abs());
    double lat1 = getRadiusFrom(angle: fromLatitude);
    double lat2 = getRadiusFrom(angle: toLatitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = R * c;
    return distance;
  }

  /// 두 점을 입력 받아 두 점 사이의 거리를 반환한다.
  double distanceBetweenPoints(
      {required Offset firstPosition, required Offset secondPosition}) {
    double x = (firstPosition.dx - secondPosition.dx) *
        (firstPosition.dx - secondPosition.dx);
    double y = (firstPosition.dy - secondPosition.dy) *
        (firstPosition.dy - secondPosition.dy);
    return sqrt(x + y);
  }

  double heightFromWidth(
      {required double widgetWidth,
      required double standardWidth,
      required double standartHeight}) {
    return widgetWidth * standartHeight / standardWidth;
  }

  /// 텍스트 위젯의 크기를 계산하여 반환한다.
  Size textSize(
    String text,
    TextStyle style, {
    double maxWidth = double.infinity,
    int? maxLines,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr,
        maxLines: maxLines)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  Size widgetSize(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      return size;
    }
    return const Size(0, 0);
  }
}