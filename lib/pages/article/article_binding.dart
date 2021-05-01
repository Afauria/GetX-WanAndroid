import 'package:get/get.dart';
import 'package:getx_sample/pages/article/article_controller.dart';

class ArticleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }
}