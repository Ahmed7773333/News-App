import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/home_layout.dart';
import 'package:news_app/theming/app_theme.dart';

void main(List<String> args) {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeLayout.routeName,
          theme: AppTheme.lightMode,
          routes: {
            HomeLayout.routeName: (context) => const HomeLayout(),
          },
        ));
  }
}
