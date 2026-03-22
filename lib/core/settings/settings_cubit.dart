import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/core/settings/settings_state.dart';


class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
    themeMode: ThemeMode.light,
   // locale: Locale('en'),
  ));

  void chooseTheme(ThemeMode mode) {
    emit(
      state.copyWith(themeMode: mode)

    );
  }

  // void changeLanguage(String langCode) {
  //   emit(
  //     state.copyWith(
  //       locale: Locale(langCode),
  //     ),
  //   );
  // }
}