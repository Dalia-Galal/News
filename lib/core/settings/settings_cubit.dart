import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/core/settings/settings_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
    : super(SettingsState(themeMode: ThemeMode.light, locale: Locale('en')));

  Future<void> loadSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final isDark = preferences.getBool('isDark') ?? false;
    final language = preferences.getString('lang') ?? 'en';
    emit(
      state.copyWith(
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        locale: Locale(language),
      ),
    );
  }

  Future<void> chooseTheme(ThemeMode mode) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isDark', mode == ThemeMode.dark);
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> changeLanguage(String language)async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('lang', language);
    emit(state.copyWith(locale: Locale(language)));
  }
}
