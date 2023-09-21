import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30.h,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AssetsData.testIMage),
        ),
      ),
    );
  }
}
