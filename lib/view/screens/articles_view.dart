import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../controller/constants/colors.dart';

class ArticlesView extends StatefulWidget {
  final String blogUrl;

  const ArticlesView({super.key, required this.blogUrl});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: WebView(
            initialUrl: widget.blogUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
