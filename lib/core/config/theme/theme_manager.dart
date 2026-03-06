import 'package:flutter/material.dart';
import 'package:news/core/config/theme/color_palette.dart';

abstract class ThemeManager {
  static ThemeData lightThemeData =ThemeData(
    scaffoldBackgroundColor: ColorPalette.black,
    
  );
  static ThemeData darkThemeData =ThemeData(
      scaffoldBackgroundColor: ColorPalette.white,
  );
}