import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/json%20models/json_model.dart';
import 'package:news_app/theming/colors.dart';

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
  final Sources sources;
  bool isSelected;

  TabItem({super.key, required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isSelected = isSelected == false ? true : false;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: isSelected ? greenColor : Colors.transparent,
          border: Border.all(color: greenColor),
          borderRadius: BorderRadius.circular(35.r),
        ),
        child: Text(
          sources.name ?? '',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: isSelected ? Colors.white : greenColor,
              ),
        ),
      ),
    );
  }
}
