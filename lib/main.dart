import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/page/article_webview_page.dart';
import 'package:news_app/page/detail_page.dart';
import 'package:news_app/page/home_page.dart';
import 'package:news_app/common/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: Theme.of(context)
        .colorScheme
        .copyWith(
          primary: primaryColor,
          onPrimary: Colors.black,
          secondary: secondaryColor
        ),
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0)
              )
            )
          ),
        )
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        DetailPage.routeName: (context) => DetailPage(
          article: ModalRoute.of(context)?.settings.arguments as Article,
          ),
        WebViewPage.routeName:(context) => WebViewPage(
          url: ModalRoute.of(context)?.settings.arguments as String
          ),
      },
    );
  }
}