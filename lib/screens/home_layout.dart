import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/categories.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/widgets/category_data.dart';
import 'package:news_app/widgets/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = '/home';
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isSearchVisible = false;

  void toggleSearchBarVisibility() {
    setState(() {
      isSearchVisible = !isSearchVisible;
    });
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScree(onClicked: onDrawerClicked),
      appBar: AppBar(
        title: Text(
          categoryData == null
              ? AppLocalizations.of(context)?.defaulttitle ?? 'title'
              : categoryData!.text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.h),
          child: categoryData == null
              ? Container()
              : TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                        onTap: () {
                          q = '';
                          searchController.clear();
                          setState(() {});
                        },
                        child: const Icon(Icons.close)),
                    suffixIcon:
                        InkWell(onTap: () {}, child: const Icon(Icons.search)),
                    hintText: AppLocalizations.of(context)?.search ?? 'sear',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                  onSubmitted: (query) {
                    setState(() {
                      q = searchController.text;
                      debugPrint(q);
                    });
                  },
                ),
        ),
      ),
      body: categoryData == null
          ? CategoriesScreen(onClicked: onClicked)
          : HomeScreen(
              categoryData: categoryData!,
              q: q,
            ),
    );
  }

  CategoryData? categoryData;
  String? q;

  void onClicked(selectedCategory) {
    categoryData = selectedCategory;
    setState(() {});
  }

  void onDrawerClicked() {
    categoryData = null;
    searchController.clear();
    q = '';
    Navigator.pop(context);
    setState(() {});
  }
}
