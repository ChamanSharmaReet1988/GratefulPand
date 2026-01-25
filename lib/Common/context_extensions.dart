import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;

  bool get isSmallScreen => screenHeight < 700;
}
