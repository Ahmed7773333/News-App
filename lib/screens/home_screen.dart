// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/widgets/category_data.dart';

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
    return FutureBuilder(
      future: ApiManager.getSource(categoryData.id),
      builder: (context, snapshot) {
        var sources = snapshot.data?.sources ?? [];

        debugPrint('${sources.first.category}\n${sources.first.description}');
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
        return TabsController(sources: sources);
        // return ListView.builder(
        //   itemBuilder: (context, index) {
        //     return Container(
        //       width: 360.58.w,
        //       height: 310.5.h,
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: NetworkImage(
        //             sources[index].url ?? '',
        //           ),
        //           fit: BoxFit.fill,
        //         ),
        //       ),
        //       child: RichText(
        //         text: TextSpan(
        //           text: sources[index].name,
        //           style: Theme.of(context).textTheme.bodyMedium,
        //           children: <TextSpan>[
        //             TextSpan(
        //               text: sources[index].description,
        //               style: Theme.of(context).textTheme.bodySmall,
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        //   itemCount: sources.length,
        // );
      },
    );
  }
}
