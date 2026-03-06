import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:news/core/config/theme/color_palette.dart';
import 'package:news/models/category_data_model.dart';

class NewsCardWidget extends StatelessWidget {
  final bool isLeft;
  final Function(CategoryDataModel) onTap;
  final CategoryDataModel categoryDataModel;
  const NewsCardWidget({
    super.key,
    required this.isLeft,
    required this.categoryDataModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(categoryDataModel.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12),
        child: Directionality(
          textDirection: isLeft ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 20,
            children: [
              Text(
                categoryDataModel.title,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.white,
                ),
              ),

              Bounceable(
                onTap:(){onTap(categoryDataModel);},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(84),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: ColorPalette.white,
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
