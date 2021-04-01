library scroll_with_tabs;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scroll_with_tabs/models/TabData.dart';

typedef ScrollIndexedWidgetBuilder = Widget Function(
    BuildContext context, int index);

class ScrollWithTabs extends StatefulWidget {
  final List<TabData> tabDataList;
  final ScrollIndexedWidgetBuilder itemBuilder;

  ScrollWithTabs({this.tabDataList, this.itemBuilder});

  @override
  _ScrollWithTabsState createState() => _ScrollWithTabsState();
}

class _ScrollWithTabsState extends State<ScrollWithTabs> {
  ScrollController scrollController;
  final List<ValueKey<int>> keys = [];
  final List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabDataList.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
              )
            ];
          },
          body: Builder(
            builder: (context) {
              scrollController = PrimaryScrollController.of(context);
              scrollController.addListener(scrollListener);
              return ListView(
                children: buildChildren(context),
              );
            },
          ),
        ));
  }

  void scrollListener() async {}

  List<Widget> buildChildren(BuildContext context) {
    if (widgets.length == 0) {
      for (int index = 0; index < widget.tabDataList.length; index++) {
        final key = ValueKey<int>(index);
        Widget item = Container(
          key: key,
          child: widget.itemBuilder?.call(context, index),
        );
        widgets.add(item);
        keys.add(key);
      }
    }
    return widgets;
  }
}
