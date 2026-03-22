import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/settings/settings_cubit.dart';
import '../../../core/theme/color_palette.dart';

class CustomDialogueWidget extends StatelessWidget {
  const CustomDialogueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight =
        context.watch<SettingsCubit>().state.themeMode == ThemeMode.light;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorPalette.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Choose Theme",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorPalette.white,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                "Dark",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.white,
                ),
              ),

              trailing: Switch(
               //  activeThumbColor: ColorPalette.white,
               //  inactiveThumbColor: ColorPalette.black,
               //  trackOutlineColor: WidgetStatePropertyAll(Colors.white),
               //  inactiveTrackColor: (Colors.white),
               // activeTrackColor:  ColorPalette.black,

                value: !isLight,
                onChanged: (_) {
                  context.read<SettingsCubit>().chooseTheme(ThemeMode.dark);
                },
              ),
            ),
            ListTile(
              title: Text(
                "Light",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Switch(
                // activeThumbColor: ColorPalette.white,
                // inactiveThumbColor: ColorPalette.black,

                value: isLight,
                onChanged: (_) {
                  context.read<SettingsCubit>().chooseTheme(ThemeMode.light);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
