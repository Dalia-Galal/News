import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/config/page_route_names.dart';
import 'package:news/core/theme/color_palette.dart';
import 'package:news/modules/home/widgets/custom_dialogue_widget.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/settings/settings_cubit.dart';
import '../../../gen/assets.gen.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({super.key});

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    var appLocal = AppLocalizations.of(context);
    bool isLight =
        context.watch<SettingsCubit>().state.themeMode == ThemeMode.light;
    bool isTheme = true;
    bool isEnglish =
        context.watch<SettingsCubit>().state.locale == Locale('en');
    return SafeArea(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width * 0.65,
        child: Column(
          children: [
            Container(
              height: 165,
              width: double.infinity,
              color: ColorPalette.white,
              alignment: Alignment.center,
              child: Text(
                appLocal!.newsApp,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                spacing: 10,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteNames.home);
                    },
                    child: Row(
                      spacing: 20,
                      children: [
                        Assets.icons.home.svg(),
                        Text(
                          appLocal.goToHome,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorPalette.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: ColorPalette.white),
                  Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Assets.icons.theme.svg(),
                          Text(
                            appLocal.theme,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorPalette.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 55,
                        width: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          border: Border.all(color: ColorPalette.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                isLight ? appLocal.light : appLocal.dark,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: ColorPalette.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return CustomDialogueWidget(
                                        title: appLocal.chooseTheme,
                                        offText: appLocal.dark,
                                        getValue: (context) {
                                          final isLight =
                                              context
                                                  .watch<SettingsCubit>()
                                                  .state
                                                  .themeMode ==
                                              ThemeMode.light;
                                          return !isLight;
                                        },
                                        onChanged: (context, val) {
                                          context
                                              .read<SettingsCubit>()
                                              .chooseTheme(
                                                val
                                                    ? ThemeMode.dark
                                                    : ThemeMode.light,
                                              );
                                        },
                                      );
                                    },
                                  );
                                },
                                icon: Assets.icons.arrow.svg(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: ColorPalette.white),
                  Column(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Assets.icons.globe.svg(),
                          Text(
                            appLocal.language,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorPalette.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 55,
                        width: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          border: Border.all(color: ColorPalette.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (isEnglish)
                                    ? appLocal.english
                                    : appLocal.arabic,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: ColorPalette.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return CustomDialogueWidget(
                                        title: appLocal.chooseLanguage,
                                        offText: appLocal.english,
                                        getValue: (context) {
                                          return context
                                                  .watch<SettingsCubit>()
                                                  .state
                                                  .locale ==
                                              Locale('en');
                                        },
                                        onChanged: (context, val) {
                                          context
                                              .read<SettingsCubit>()
                                              .changeLanguage(
                                                val ? 'en' : 'ar',
                                              );
                                        },
                                      );
                                    },
                                  );
                                },
                                icon: Assets.icons.arrow.svg(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* SafeArea(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width * 0.65,
        child: Column(
          children: [
            Container(
              height: 165,
              width: double.infinity,
              color: ColorPalette.white,
              alignment: Alignment.center,
              child: Text(
                appLocal!.newsApp,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                spacing: 10,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteNames.home);
                    },
                    child: Row(
                      spacing: 20,
                      children: [
                        Assets.icons.home.svg(),
                        Text(
                          appLocal.goToHome,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorPalette.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: ColorPalette.white),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorPalette.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ExpansionTile(
                      trailing:  Assets.icons.arrow.svg(),
                      iconColor: ColorPalette.white,
                      collapsedIconColor: ColorPalette.white,
                      title: Row(
                        children: [
                          Assets.icons.theme.svg(),
                          SizedBox(width: 8),
                          Text(
                            appLocal.theme,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorPalette.white,
                            ),
                          ),
                        ],
                      ),

                      children: [
                        ListTile(
                          title: Text(
                            appLocal.light,
                            style: TextStyle(color: ColorPalette.white),
                          ),
                          onTap: () {
                            context.read<SettingsCubit>().chooseTheme(
                              ThemeMode.light,
                            );
                          },
                        ),

                        ListTile(
                          title: Text(
                            appLocal.dark,
                            style: TextStyle(color: ColorPalette.white),
                          ),
                          onTap: () {
                            context.read<SettingsCubit>().chooseTheme(
                              ThemeMode.dark,
                            );

                            },
                        ),
                      ],
                    ),
                  ),
                  Divider(color: ColorPalette.white),
                  Column(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                        border: Border.all(color: ColorPalette.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                        child: ExpansionTile(
                          trailing:  Assets.icons.arrow.svg(),
                          iconColor: ColorPalette.white,
                          collapsedIconColor: ColorPalette.white,

                          title: Row(
                            children: [
                              Assets.icons.globe.svg(),
                              SizedBox(width: 8),
                              Text(
                                appLocal.language,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: ColorPalette.white,
                                ),
                              ),
                            ],
                          ),

                          children: [
                            ListTile(
                              title: Text(appLocal.english, style: TextStyle(color: Colors.white)),
                              onTap: () {
                                context.read<SettingsCubit>().changeLanguage(('en'));
                              },
                            ),
                            ListTile(
                              title: Text(appLocal.arabic, style: TextStyle(color: Colors.white)),
                              onTap: () {
                                context.read<SettingsCubit>().changeLanguage(('ar'));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );*/
