import 'package:flutter/material.dart';

extension ResponsiveExtension on num {
  double r(BuildContext context) {
    return this * AppResponsive.scale(context);
  }
}

class AppResponsive {
  static double scale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 360) return 0.85;
    if (width < 600) return 1.0;
    if (width < 900) return 1.2;
    return 1.4; // tablets
  }
}