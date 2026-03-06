
import 'package:flutter/material.dart';
import 'package:news/core/config/theme/color_palette.dart';

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
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: 360,
      height: 415,
      decoration: BoxDecoration(
        color: ColorPalette.black,
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
              style: TextStyle(color: ColorPalette.white),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    child: Text('View Full Article',style:
                    TextStyle(color: ColorPalette.black),),
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
