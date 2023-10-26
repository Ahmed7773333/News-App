import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/home_layout.dart';

import '../theming/assets.dart';
import '../widgets/space.dart';

class SplachScreen extends StatelessWidget {
  static const String routeName = '/splach';
  const SplachScreen({super.key});

  Future<void> _navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 209.h,
          width: 200.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                logo,
                height: 208.h,
                width: 199.w,
                fit: BoxFit.fill,
              ),
              const VerticalSpace(40),
              Text(
                'News App',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
