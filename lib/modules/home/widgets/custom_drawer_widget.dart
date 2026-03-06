import 'package:flutter/material.dart';
import 'package:news/core/config/routes/page_route_names.dart';
import 'package:news/core/config/theme/color_palette.dart';

import '../../../gen/assets.gen.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onTap:(){Navigator.pushNamed(context, PageRouteNames.home);},
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
