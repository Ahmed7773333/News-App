// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/widgets/category_data.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryData});
  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 171.h,
      width: 148.w,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(categoryData.image),
          ),
          color: categoryData.color),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          categoryData.text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
