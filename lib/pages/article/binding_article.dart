import 'package:get/get.dart';
import 'package:getx_sample/pages/article/controller_article.dart';

class ArticleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }
}