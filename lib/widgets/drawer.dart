import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/settings.dart';
import 'package:news_app/theming/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:news_app/widgets/space.dart';

class DrawerScree extends StatelessWidget {
  final Function onClicked;
  const DrawerScree({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 88.h,
              width: double.infinity,
              color: greenColor,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(AppLocalizations.of(context)?.defaulttitle ?? '',
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            InkWell(
              onTap: () {
                onClicked();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 30.sp,
                  ),
                  const HorizontalSpace(5),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const VerticalSpace(15),
            Row(
              children: [
                Icon(
                  Icons.language,
                  size: 30.sp,
                ),
                const HorizontalSpace(5),
                const LocaleButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
