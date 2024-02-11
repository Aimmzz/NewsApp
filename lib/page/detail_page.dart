import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/page/article_webview_page.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/article_detail';
  final Article article;

  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.article.urlToImage,
              child: Image.network(widget.article.urlToImage)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.article.description),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Text(
                      widget.article.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    Text('Date: ${widget.article.publishedAt}'),
                    const SizedBox(height: 10),
                    Text('Author: ${widget.article.author}'),
                    const Divider(color: Colors.grey),
                    Text(
                      widget.article.content,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('Read more'),
                      onPressed: () {
                        Navigator.pushNamed(context, WebViewPage.routeName, arguments: widget.article.url);
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}