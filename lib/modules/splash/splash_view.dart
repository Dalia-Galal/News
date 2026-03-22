import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/config/page_route_names.dart';
import 'package:news/core/settings/settings_cubit.dart';
import 'package:news/gen/assets.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PageRouteNames.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLight =
    (context.watch<SettingsCubit>().state.themeMode == ThemeMode.light);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
             mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              Image.asset(isLight?
                Assets.images.mic.path :Assets.images.micDark.path,
                width: 170,
                height: 200,
                alignment: AlignmentGeometry.center,

              ),
              Spacer(),
              Image.asset(
                isLight?
                Assets.images.newsBranding.path:Assets.images.newsBrandingDark.path,
                width: 270,
                height: 120,
                alignment: AlignmentGeometry.topCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
