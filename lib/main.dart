import 'package:flutter/material.dart';
import 'package:news/core/config/routes/app_router.dart';
import 'package:news/core/config/routes/page_route_names.dart';

void main() {
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
