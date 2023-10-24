import 'package:flutter/material.dart';

import 'package:news_app/json%20models/json_model.dart';
import 'package:news_app/widgets/tab.dart';

class TabsController extends StatefulWidget {
  final List<Sources> sources;
  const TabsController({super.key, required this.sources});

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: TabBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        isScrollable: true,
        tabs: widget.sources
            .map((e) => Tab(
                  child: TabItem(
                    sources: e,
                    isSelected: selectedIndex == widget.sources.indexOf(e),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
