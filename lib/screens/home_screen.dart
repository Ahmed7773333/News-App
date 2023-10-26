// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/json%20models/json_model.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:news_app/widgets/category_data.dart';
import 'package:provider/provider.dart';

import '../remote/api_manager.dart';
import 'tabs_controller.dart';

class HomeScreen extends StatelessWidget {
  final CategoryData categoryData;
  final String? q;
  const HomeScreen({
    Key? key,
    required this.categoryData,
    this.q,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponce>(
      future: ApiManager.getSource(
          categoryData.id, Provider.of<LanguageProvider>(context).locale),
      builder: (context, snapshot) {
        var sources = snapshot.data?.sources ?? [];

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('${snapshot.error}');
          return Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 30.sp,
            ),
          );
        }
        return TabsController(
          sources: sources,
          q: q,
        );
      },
    );
  }
}
