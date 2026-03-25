import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/settings/settings_cubit.dart';
import '../../../core/theme/color_palette.dart';

class CustomDialogueWidget extends StatelessWidget {
  final String title;
  final String offText;

  final bool Function(BuildContext) getValue;

  final void Function(BuildContext, bool) onChanged;

  const CustomDialogueWidget({
    super.key,
    required this.title,
    required this.offText,
    required this.getValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final value = getValue(context);
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
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorPalette.white,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                offText,
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
                value: value,
                onChanged: (val) {
                  Navigator.pop(context);
                  onChanged(context, val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
