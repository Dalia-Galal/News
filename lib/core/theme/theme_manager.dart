import 'package:flutter/material.dart';
import 'package:news/core/theme/color_palette.dart';

abstract class ThemeManager {
  static ThemeData lightThemeData =ThemeData(
    scaffoldBackgroundColor: ColorPalette.white,
    
  );
  static ThemeData darkThemeData =ThemeData(
      scaffoldBackgroundColor: ColorPalette.black,
  );
}