import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/config/page_route_names.dart';
import 'package:news/core/theme/color_palette.dart';
import 'package:news/modules/home/widgets/custom_dialogue_widget.dart';

import '../../../core/settings/settings_cubit.dart';
import '../../../gen/assets.gen.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({super.key});

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<SettingsCubit>().state.themeMode == ThemeMode.light;
    return
      SafeArea(
      child: Container(
        color:Colors.black,
        width: MediaQuery.of(context).size.width * 0.65,
        child: Column(
          children: [
            Container(
              height: 165,
              width: double.infinity,
              color: ColorPalette.white,
              alignment: Alignment.center,
              child: Text(
                'NewsApp',
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
                          'Go To Home',
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
                            'Theme',
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
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                isLight ? 'Light' : 'Dark',
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
                                      return CustomDialogueWidget();
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
                            'Language',
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
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (isEnglish) ? 'English' : 'Arabic',
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
                                      return Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: ColorPalette.black,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Choose Language",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorPalette.white,
                                                ),
                                              ),
                                              SizedBox(height: 16),

                                              ListTile(
                                                title: Text(
                                                  "English",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: ColorPalette.white,
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    isEnglish = true;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              ),

                                              ListTile(
                                                title: Text(
                                                  "Arabic",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: ColorPalette.white,
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    isEnglish = false;
                                                  });

                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
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
