import 'package:flutter/material.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

class LocaleButton extends StatelessWidget {
  const LocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.white,
      activeTrackColor: Colors.black,
      activeColor: Colors.black,
      value: Provider.of<LanguageProvider>(context, listen: false).locale ==
          const Locale('en'),
      onChanged: (value) {
        if (Provider.of<LanguageProvider>(context, listen: false).locale ==
            const Locale('en')) {
          Provider.of<LanguageProvider>(context, listen: false)
              .setLanguage(const Locale('ar'));
        } else {
          Provider.of<LanguageProvider>(context, listen: false)
              .setLanguage(const Locale('en'));
        }
      },
    );
  }
}
