import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_data.dart';
import 'package:news_app/widgets/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  Function onClicked;

  CategoriesScreen({super.key, required this.onClicked});
  @override
  Widget build(BuildContext context) {
    final List<CategoryData> categories = CategoryData.getCategories(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context)?.pick ?? 'pick',
            style: Theme.of(context).textTheme.bodyLarge),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    onClicked(categories[index]);
                  },
                  child: CategoryItem(categoryData: categories[index]));
            },
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
