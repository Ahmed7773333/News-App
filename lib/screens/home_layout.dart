import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/screens/tabs_controller.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = '/home';
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18.r),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(67.h),
          child: Container(),
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getSource(),
        builder: (context, snapshot) {
          var sources = snapshot.data?.sources ?? [];
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
      ),
    );
  }
}
