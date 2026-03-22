import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/routes/app_router.dart';
import 'package:news/core/config/page_route_names.dart';
import 'package:news/core/settings/settings_cubit.dart';
import 'package:news/core/theme/theme_manager.dart';

import 'core/bloc_observer.dart';
import 'core/settings/settings_state.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(
    BlocProvider(create: (context) => SettingsCubit(), child: (const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'News',
          theme: ThemeManager.lightThemeData,
          darkTheme: ThemeManager.darkThemeData,
          themeMode: state.themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: PageRouteNames.initial,
          onGenerateRoute: AppRouter.onGenerateRoute,
          locale: const Locale('ar'),
        );
      },
    );
  }
}
