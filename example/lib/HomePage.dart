import 'package:flutter/material.dart';
import 'package:scroll_with_tabs/models/TabData.dart';
import 'package:scroll_with_tabs/scroll_with_tabs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: ScrollWithTabs(
          tabDataList: tabData(),
          itemBuilder: (_, index) {
            return Container(
              height: 30,
              width: size.width,
              color: index % 2 == 0 ? Colors.green : Colors.red,
            );
          },
        ));
  }

  List<TabData> tabData() {
    return [
      TabData(),
      TabData(),
      TabData(),
    ];
  }
}
