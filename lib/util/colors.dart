import 'package:flutter/material.dart';


class XColors {

  static bool getDarkMode = true;

  static Color background() => getDarkMode != true ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  static Color white() => getDarkMode != true ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
  static Color textGrey() => getDarkMode != true ? const Color(0xFFC42D32) : const Color(0xFFDBD0D0);
  static Color mainColor() => getDarkMode != true ? const Color(0xFFC42D32) : const Color(0xFFC42D32);
  static Color primaryColor() => const Color(0xFF4BB197);
  static Color surfaceColor() => getDarkMode != true ? const Color(0xFFE8EBEA) : const Color(0xFFFFFFFF);
  static Color decoratorContainerColor() => getDarkMode != true ? const Color(0xFFFFFFFF) : const Color(0xFF2D0203) ;
  static Color textColor() => getDarkMode != true ? const Color(0xFFC42D32) : const Color(0xFFFFFFFF).withOpacity(0.9);

}
