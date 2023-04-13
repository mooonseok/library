import 'dart:io';

import 'package:flutter/foundation.dart';

abstract class ConstPaths {
  // asset paths
  static const assets = 'lib/assets';
  static const imageAssets = "$assets/images/bitmaps/";
  static const svgAssets = "$assets/images/vectors/";

  // server paths
  static const _productionUrl = '43.200.187.166:7300';
  static final _developUrl =
      Platform.isAndroid ? '192.168.0.2' : 'localhost:7300';
  static final baseUrl = kReleaseMode ? _productionUrl : _developUrl;
}
