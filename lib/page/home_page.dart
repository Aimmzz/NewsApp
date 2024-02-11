import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/style.dart';
import 'package:news_app/page/article_list_page.dart';
import 'package:news_app/page/setting_page.dart';
import 'package:news_app/widget/platform_widget.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/home_page';
  const NewsListPage({Key? key}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  int _bottomNavIndex = 0;

  final List<Widget> listWidget = [
    const ArticleListPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: buildAndroid, iosBuilder: buildIos);
  }

  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      body: listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget buildIos(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: secondaryColor,
          items: bottomNavBarItems
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 1:
              return const SettingPage();
            default:
              return const ArticleListPage();
          }
        });
  }

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      label: "Headline",
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: "Setting",
    ),
  ];
}
