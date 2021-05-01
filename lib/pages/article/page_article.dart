import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_sample/pages/article/controller_article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageArticle extends GetView<ArticleController> {
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
