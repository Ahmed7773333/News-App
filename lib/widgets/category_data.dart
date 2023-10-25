import 'package:flutter/material.dart';

import '../theming/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryData {
  CategoryData(
      {required this.id,
      required this.image,
      required this.text,
      required this.color});
  String id;
  String image;
  String text;
  Color color;
  static List<CategoryData> getCategories(BuildContext context) {
    return [
      CategoryData(
          image: sports,
          color: Colors.red,
          text: AppLocalizations.of(context)?.sports ?? 'polit',
          id: 'sports'),
      CategoryData(
          image: judge,
          color: const Color(0xff003E90),
          text: AppLocalizations.of(context)?.politics ?? 'polit',
          id: 'technology'),
      CategoryData(
          image: health,
          color: const Color(0xffED1E79),
          text: AppLocalizations.of(context)?.health ?? 'he',
          id: 'health'),
      CategoryData(
          image: bis,
          color: const Color(0xffCF7E48),
          text: AppLocalizations.of(context)?.bis ?? 'polit',
          id: 'business'),
      CategoryData(
          image: green,
          color: const Color(0xff4882CF),
          text: AppLocalizations.of(context)?.enviroment ?? 'polit',
          id: 'entertainment'),
      CategoryData(
          image: science,
          color: const Color(0xffF2D352),
          text: AppLocalizations.of(context)?.enviroment ?? 'polit',
          id: 'science'),
      CategoryData(
          image: news,
          color: Colors.white,
          text: AppLocalizations.of(context)?.news ?? 'polit',
          id: 'general'),
    ];
  }
}
