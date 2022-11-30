import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsSource extends StatefulWidget {
  NewsSource(
      {required this.url,
        Key? key})
      : super(key: key);
  String url;


  @override
  State<NewsSource> createState() => _NewsSourceState();
}

class _NewsSourceState extends State<NewsSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
