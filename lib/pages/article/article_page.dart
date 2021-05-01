import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_sample/pages/article/article_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends GetView<ArticleController> {
  final link = Get.arguments;
  @override
  Widget build(_) {
    return SafeArea(
      child: WebView(
        onWebViewCreated: (_) => Get.dialog(CupertinoActivityIndicator()),
        onPageStarted: (_) {},
        onPageFinished: (_) => Get.back(),
        initialUrl: link,
      ),
    );
  }
}