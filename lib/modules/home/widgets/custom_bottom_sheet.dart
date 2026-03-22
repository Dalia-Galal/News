
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/settings/settings_cubit.dart';
import 'package:news/core/theme/color_palette.dart';

import '../../../gen/assets.gen.dart';

class CustomBottomSheet extends StatelessWidget {
  final String description;
  final String url;
  final String urlToImage;
  final  VoidCallback onPressed;

  const CustomBottomSheet({
    super.key,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isLight =
    (context.watch<SettingsCubit>().state.themeMode == ThemeMode.light);
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: 360,
      height: 415,
      decoration: BoxDecoration(
        color:isLight? ColorPalette.black:ColorPalette.white,
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(urlToImage, fit: BoxFit.fill),
          ),
          Expanded(
            child: Text(
              description,
              style: TextStyle(color: isLight?ColorPalette.white:ColorPalette.black),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLight?Colors.white:ColorPalette.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    child: Text('View Full Article',style:
                    TextStyle(color:isLight?ColorPalette.black:ColorPalette.white),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
