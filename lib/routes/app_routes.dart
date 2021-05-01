import 'package:get/get.dart';
import 'package:getx_sample/pages/article/article_binding.dart';
import 'package:getx_sample/pages/article/article_page.dart';
import 'package:getx_sample/pages/home/home_binding.dart';
import 'package:getx_sample/pages/home/home_page.dart';

class AppPages {
  static const PATH_INITIAL = "/home";
  static const PATH_INDEX = "/index";
  static const PATH_ARTICLE_DETAIL = "/article";

  static final routes = [
    GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: "/article", page: () => ArticlePage(), binding: ArticleBinding()),
  ];
}
