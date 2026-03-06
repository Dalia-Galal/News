import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/core/config/routes/app_router.dart';
import 'package:news/core/config/routes/page_route_names.dart';

import 'core/bloc_observer.dart';

import 'package:url_launcher/url_launcher.dart';
void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News',
        debugShowCheckedModeBanner: false,
        initialRoute: PageRouteNames.initial,
        onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
