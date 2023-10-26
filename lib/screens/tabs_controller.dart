// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/json%20models/json_model.dart';
import 'package:news_app/json%20models/news_json_model.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/widgets/tab.dart';

class TabsController extends StatefulWidget {
  final List<Sources> sources;
  final String? q;
  const TabsController({
    Key? key,
    required this.sources,
    this.q,
  }) : super(key: key);

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            indicatorColor: Colors.transparent,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            tabs: widget.sources
                .map((e) => Tab(
                      child: TabItem(
                        sources: e,
                        isSelected: widget.sources.indexOf(e) == selectedIndex,
                      ),
                    ))
                .toList(),
          ),
        ),
        FutureBuilder<NewsResponce>(
          future: ApiManager.getNews(
              widget.sources[selectedIndex].id ?? '', widget.q ?? ''),
          builder: (context, snapshot) {
            var news = snapshot.data?.articles ?? [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            }
            if (snapshot.hasError) {
              return Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 30.sp,
                ),
              );
            }
            if (snapshot.data?.status != 'ok') {
              return TextButton(
                child: Center(
                  child: Text(
                    'try again',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                onPressed: () {},
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 12,
                    child: Column(
                      children: [
                        Container(
                          width: 360.58.w,
                          height: 310.5.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                news[index].urlToImage ?? '',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: RichText(
                            text: TextSpan(
                              text: ' ${news[index].author}\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontWeight: FontWeight.w300),
                              children: <TextSpan>[
                                TextSpan(
                                  text: news[index].description,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
