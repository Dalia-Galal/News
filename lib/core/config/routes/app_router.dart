import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/config/routes/page_route_names.dart';
import 'package:news/modules/home/home_view.dart';
import 'package:news/modules/home/pages/search_view.dart';
import 'package:news/modules/splash/splash_view.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(builder: (context) => SplashView());
      case PageRouteNames.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case PageRouteNames.search:
        return MaterialPageRoute(builder: (context) =>SearchView());
      default:
        return MaterialPageRoute(builder: (context) => SplashView());
    }
  }
}
