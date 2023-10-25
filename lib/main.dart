import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:news_app/screens/home_layout.dart';
import 'package:news_app/theming/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
    ),
  ], child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          initialRoute: HomeLayout.routeName,
          theme: AppTheme.lightMode,
          locale: Provider.of<LanguageProvider>(context).locale,
          routes: {
            HomeLayout.routeName: (context) => const HomeLayout(),
          },
        ));
  }
}
