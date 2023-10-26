import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/categories.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/widgets/category_data.dart';
import 'package:news_app/widgets/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/widgets/text_field.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = '/home';
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isSearchVisible = false;

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScree(onClicked: onDrawerClicked),
      appBar: AppBar(
        title: Stack(
          children: [
            Visibility(
              visible: isSearchVisible,
              child: CustomTextField(
                controller: searchController,
                hint: AppLocalizations.of(context)?.search ?? '',
                onPreClicked: onPreClicked,
                func: submit,
              ),
            ),
            Visibility(
              visible: !isSearchVisible,
              child: Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    categoryData == null
                        ? AppLocalizations.of(context)?.defaulttitle ?? 'title'
                        : categoryData!.text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSearchVisible = true;
                      });
                    },
                    child: Visibility(
                      visible: !(categoryData == null),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
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
    isSearchVisible = false;
    categoryData = null;
    searchController.clear();
    q = '';
    Navigator.pop(context);
    setState(() {});
  }

  void onPreClicked() {
    isSearchVisible = false;
    searchController.clear();
    q = '';
    setState(() {});
  }

  void submit() {
    setState(() {
      q = searchController.text;
    });
  }
}
